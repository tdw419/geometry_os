; DESCRIPTION: Places a magenta line segment connecting (403, 167) to (256, 124).
; PLAN: r0=403(x1), r1=167(y1), r2=256(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 167
LDI r2, 256
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
