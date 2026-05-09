; DESCRIPTION: Composite: Sets a single green pixel at (117, 84) then Renders a blue disk with center (423, 133) and radius 63 then Renders a yellow box of size 99x63 starting at (209, 163).
; PLAN: r0=117(x), r1=84(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=423(x), r6=133(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=209(x), r11=163(y), r12=99(width), r13=63(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 84
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 423
LDI r6, 133
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 209
LDI r11, 163
LDI r12, 99
LDI r13, 63
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
