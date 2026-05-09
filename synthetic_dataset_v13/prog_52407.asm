; DESCRIPTION: Composite: Places a green line segment connecting (409, 61) to (451, 166) then Places a magenta dot at position (205, 56) then Places a red circle of radius 33 at center (164, 188).
; PLAN: r0=409(x1), r1=61(y1), r2=451(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=56(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=164(x), r11=188(y), r12=33(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 409
LDI r1, 61
LDI r2, 451
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 56
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 164
LDI r11, 188
LDI r12, 33
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
