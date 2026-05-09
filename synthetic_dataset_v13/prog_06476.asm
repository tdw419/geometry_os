; DESCRIPTION: Composite: Creates a purple rectangular region at (399, 94) spanning 109 by 26 pixels then Renders a cyan line between points (238, 249) and (392, 3) then Places a white dot at position (193, 121).
; PLAN: r0=399(x), r1=94(y), r2=109(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x1), r6=249(y1), r7=392(x2), r8=3(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=193(x), r11=121(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 399
LDI r1, 94
LDI r2, 109
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 249
LDI r7, 392
LDI r8, 3
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 121
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
