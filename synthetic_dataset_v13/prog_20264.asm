; DESCRIPTION: Composite: Places a yellow circle of radius 20 at center (218, 101) then Places a green dot at position (402, 34) then Places a blue 55x66 rectangle at position (453, 187).
; PLAN: r0=218(x), r1=101(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x), r6=34(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=453(x), r11=187(y), r12=55(width), r13=66(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 101
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 34
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 453
LDI r11, 187
LDI r12, 55
LDI r13, 66
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
