; DESCRIPTION: Places a green line segment connecting (68, 160) to (358, 202).
; PLAN: r0=68(x1), r1=160(y1), r2=358(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 160
LDI r2, 358
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
