; DESCRIPTION: Places a magenta line segment connecting (352, 73) to (254, 204).
; PLAN: r0=352(x1), r1=73(y1), r2=254(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 73
LDI r2, 254
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
