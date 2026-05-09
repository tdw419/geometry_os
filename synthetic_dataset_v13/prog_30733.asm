; DESCRIPTION: Places a magenta line segment connecting (492, 172) to (326, 246).
; PLAN: r0=492(x1), r1=172(y1), r2=326(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 172
LDI r2, 326
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
