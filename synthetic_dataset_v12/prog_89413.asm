; DESCRIPTION: Composite: Draws a black line from (469, 101) to (448, 183) then Creates a cyan circular shape at (185, 90) with radius 45 then Renders a cyan box of size 21x95 starting at (417, 117).
; PLAN: r0=469(x1), r1=101(y1), r2=448(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=90(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=417(x), r11=117(y), r12=21(width), r13=95(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 469
LDI r1, 101
LDI r2, 448
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 90
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 417
LDI r11, 117
LDI r12, 21
LDI r13, 95
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
