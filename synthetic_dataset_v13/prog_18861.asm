; DESCRIPTION: Places a magenta line segment connecting (403, 201) to (488, 50).
; PLAN: r0=403(x1), r1=201(y1), r2=488(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 201
LDI r2, 488
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
