; DESCRIPTION: Places a magenta line segment connecting (102, 205) to (296, 204).
; PLAN: r0=102(x1), r1=205(y1), r2=296(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 205
LDI r2, 296
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
