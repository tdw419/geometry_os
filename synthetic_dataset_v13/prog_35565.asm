; DESCRIPTION: Composite: Draws a black rectangle at (105, 21) with width 43 and height 86 then Draws a cyan line from (201, 100) to (246, 124) then Sets a single purple pixel at (90, 191).
; PLAN: r0=105(x), r1=21(y), r2=43(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x1), r6=100(y1), r7=246(x2), r8=124(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=191(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 21
LDI r2, 43
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 100
LDI r7, 246
LDI r8, 124
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 191
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
