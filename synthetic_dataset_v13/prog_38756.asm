; DESCRIPTION: Places a green line segment connecting (510, 6) to (414, 239).
; PLAN: r0=510(x1), r1=6(y1), r2=414(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 6
LDI r2, 414
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
