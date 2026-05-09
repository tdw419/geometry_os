; DESCRIPTION: Places a white line segment connecting (69, 30) to (191, 167).
; PLAN: r0=69(x1), r1=30(y1), r2=191(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 30
LDI r2, 191
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
