; DESCRIPTION: Places a magenta line segment connecting (150, 34) to (492, 246).
; PLAN: r0=150(x1), r1=34(y1), r2=492(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 34
LDI r2, 492
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
