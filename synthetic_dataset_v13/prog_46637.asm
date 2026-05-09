; DESCRIPTION: Composite: Renders a yellow disk with center (129, 214) and radius 24 then Sets a single magenta pixel at (420, 114) then Places a green line segment connecting (435, 200) to (320, 152).
; PLAN: r0=129(x), r1=214(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=420(x), r6=114(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=435(x1), r11=200(y1), r12=320(x2), r13=152(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 214
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 420
LDI r6, 114
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 435
LDI r11, 200
LDI r12, 320
LDI r13, 152
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
