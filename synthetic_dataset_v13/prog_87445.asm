; DESCRIPTION: Composite: Draws a purple line from (340, 12) to (293, 100) then Places a black 98x118 rectangle at position (59, 81) then Places a white dot at position (129, 8).
; PLAN: r0=340(x1), r1=12(y1), r2=293(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=81(y), r7=98(width), r8=118(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=129(x), r11=8(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 12
LDI r2, 293
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 81
LDI r7, 98
LDI r8, 118
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 8
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
