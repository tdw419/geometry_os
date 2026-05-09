; DESCRIPTION: Composite: Sets a single blue pixel at (172, 112) then Places a yellow 33x104 rectangle at position (251, 88) then Renders a cyan line between points (329, 192) and (48, 179).
; PLAN: r0=172(x), r1=112(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=88(y), r7=33(width), r8=104(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=329(x1), r11=192(y1), r12=48(x2), r13=179(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 112
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 251
LDI r6, 88
LDI r7, 33
LDI r8, 104
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 192
LDI r12, 48
LDI r13, 179
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
