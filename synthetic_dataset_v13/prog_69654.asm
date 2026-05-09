; DESCRIPTION: Composite: Draws a white line from (243, 104) to (498, 199) then Places a white 88x28 rectangle at position (110, 189) then Sets a single purple pixel at (144, 22).
; PLAN: r0=243(x1), r1=104(y1), r2=498(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=189(y), r7=88(width), r8=28(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=144(x), r11=22(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 243
LDI r1, 104
LDI r2, 498
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 189
LDI r7, 88
LDI r8, 28
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 144
LDI r11, 22
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
