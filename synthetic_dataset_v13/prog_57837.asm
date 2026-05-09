; DESCRIPTION: Composite: Places a green line segment connecting (405, 29) to (108, 151) then Creates a yellow circular shape at (470, 176) with radius 23.
; PLAN: r0=405(x1), r1=29(y1), r2=108(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=470(x), r6=176(y), r7=23(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 405
LDI r1, 29
LDI r2, 108
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 176
LDI r7, 23
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
