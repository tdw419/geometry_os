; DESCRIPTION: Places a yellow line segment connecting (409, 130) to (294, 254).
; PLAN: r0=409(x1), r1=130(y1), r2=294(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 130
LDI r2, 294
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
