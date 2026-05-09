; DESCRIPTION: Composite: Draws a purple line from (28, 140) to (433, 110) then Places a white dot at position (205, 237) then Draws a cyan rectangle at (345, 35) with width 14 and height 115.
; PLAN: r0=28(x1), r1=140(y1), r2=433(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=237(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=345(x), r11=35(y), r12=14(width), r13=115(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 140
LDI r2, 433
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 237
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 345
LDI r11, 35
LDI r12, 14
LDI r13, 115
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
