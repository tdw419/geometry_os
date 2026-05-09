; DESCRIPTION: Composite: Draws a cyan line from (83, 202) to (125, 52) then Draws a blue rectangle at (396, 154) with width 65 and height 78 then Places a purple dot at position (410, 83).
; PLAN: r0=83(x1), r1=202(y1), r2=125(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=154(y), r7=65(width), r8=78(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=410(x), r11=83(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 83
LDI r1, 202
LDI r2, 125
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 154
LDI r7, 65
LDI r8, 78
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 83
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
