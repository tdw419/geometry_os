; DESCRIPTION: Composite: Draws a green circle centered at (141, 193) with radius 10 then Places a magenta dot at position (474, 67) then Places a cyan line segment connecting (348, 229) to (337, 225).
; PLAN: r0=141(x), r1=193(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x), r6=67(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=348(x1), r11=229(y1), r12=337(x2), r13=225(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 141
LDI r1, 193
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 67
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 348
LDI r11, 229
LDI r12, 337
LDI r13, 225
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
