; DESCRIPTION: Composite: Draws a cyan circle centered at (328, 95) with radius 63 then Places a magenta dot at position (23, 192) then Places a white line segment connecting (474, 18) to (325, 205).
; PLAN: r0=328(x), r1=95(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x), r6=192(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=474(x1), r11=18(y1), r12=325(x2), r13=205(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 95
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 192
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 474
LDI r11, 18
LDI r12, 325
LDI r13, 205
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
