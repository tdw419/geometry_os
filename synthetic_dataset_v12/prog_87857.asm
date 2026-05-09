; DESCRIPTION: Composite: Renders a cyan line between points (445, 82) and (273, 180) then Draws a white rectangle at (233, 70) with width 45 and height 59 then Places a red dot at position (114, 25).
; PLAN: r0=445(x1), r1=82(y1), r2=273(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=70(y), r7=45(width), r8=59(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=114(x), r11=25(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 445
LDI r1, 82
LDI r2, 273
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 70
LDI r7, 45
LDI r8, 59
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 25
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
