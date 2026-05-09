; DESCRIPTION: Composite: Renders a blue line between points (2, 191) and (20, 87) then Renders a purple box of size 28x76 starting at (469, 129) then Places a black circle of radius 32 at center (289, 138).
; PLAN: r0=2(x1), r1=191(y1), r2=20(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=129(y), r7=28(width), r8=76(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=289(x), r11=138(y), r12=32(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 2
LDI r1, 191
LDI r2, 20
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 129
LDI r7, 28
LDI r8, 76
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 138
LDI r12, 32
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
