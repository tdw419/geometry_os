; DESCRIPTION: Places a magenta line segment connecting (317, 167) to (296, 221).
; PLAN: r0=317(x1), r1=167(y1), r2=296(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 167
LDI r2, 296
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
