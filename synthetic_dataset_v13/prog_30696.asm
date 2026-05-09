; DESCRIPTION: Places a purple line segment connecting (407, 205) to (502, 69).
; PLAN: r0=407(x1), r1=205(y1), r2=502(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 205
LDI r2, 502
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
