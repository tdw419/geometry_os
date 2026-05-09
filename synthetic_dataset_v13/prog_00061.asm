; DESCRIPTION: Places a magenta line segment connecting (336, 82) to (67, 225).
; PLAN: r0=336(x1), r1=82(y1), r2=67(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 82
LDI r2, 67
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
