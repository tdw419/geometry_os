; DESCRIPTION: Composite: Places a green dot at position (38, 128) then Creates a red circular shape at (234, 102) with radius 67 then Places a yellow line segment connecting (346, 188) to (396, 189).
; PLAN: r0=38(x), r1=128(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=234(x), r6=102(y), r7=67(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=346(x1), r11=188(y1), r12=396(x2), r13=189(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 128
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 234
LDI r6, 102
LDI r7, 67
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 346
LDI r11, 188
LDI r12, 396
LDI r13, 189
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
