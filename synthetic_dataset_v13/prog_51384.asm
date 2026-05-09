; DESCRIPTION: Composite: Places a white dot at position (213, 67) then Renders a black disk with center (398, 193) and radius 55 then Renders a magenta line between points (308, 130) and (358, 96).
; PLAN: r0=213(x), r1=67(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=398(x), r6=193(y), r7=55(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=308(x1), r11=130(y1), r12=358(x2), r13=96(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 67
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 398
LDI r6, 193
LDI r7, 55
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 308
LDI r11, 130
LDI r12, 358
LDI r13, 96
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
