; DESCRIPTION: Places a magenta line segment connecting (360, 31) to (48, 246).
; PLAN: r0=360(x1), r1=31(y1), r2=48(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 31
LDI r2, 48
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
