; DESCRIPTION: Composite: Sets a single purple pixel at (488, 253) then Creates a red circular shape at (157, 124) with radius 72 then Renders a purple line between points (485, 80) and (64, 179).
; PLAN: r0=488(x), r1=253(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=157(x), r6=124(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=485(x1), r11=80(y1), r12=64(x2), r13=179(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 253
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 157
LDI r6, 124
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 485
LDI r11, 80
LDI r12, 64
LDI r13, 179
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
