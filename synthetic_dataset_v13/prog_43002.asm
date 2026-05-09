; DESCRIPTION: Places a yellow line segment connecting (310, 56) to (152, 166).
; PLAN: r0=310(x1), r1=56(y1), r2=152(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 56
LDI r2, 152
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
