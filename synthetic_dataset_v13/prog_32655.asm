; DESCRIPTION: Places a magenta line segment connecting (60, 240) to (299, 202).
; PLAN: r0=60(x1), r1=240(y1), r2=299(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 240
LDI r2, 299
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
