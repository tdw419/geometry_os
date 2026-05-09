; DESCRIPTION: Composite: Places a white line segment connecting (94, 88) to (133, 190) then Places a black 105x104 rectangle at position (213, 77) then Places a green dot at position (491, 196).
; PLAN: r0=94(x1), r1=88(y1), r2=133(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=77(y), r7=105(width), r8=104(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=491(x), r11=196(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 94
LDI r1, 88
LDI r2, 133
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 77
LDI r7, 105
LDI r8, 104
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 491
LDI r11, 196
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
