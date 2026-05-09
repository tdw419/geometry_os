; DESCRIPTION: Composite: Places a white 63x68 rectangle at position (275, 21) then Renders a black disk with center (334, 100) and radius 79 then Renders a green line between points (356, 241) and (47, 74).
; PLAN: r0=275(x), r1=21(y), r2=63(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=334(x), r6=100(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=356(x1), r11=241(y1), r12=47(x2), r13=74(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 21
LDI r2, 63
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 100
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 356
LDI r11, 241
LDI r12, 47
LDI r13, 74
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
