; DESCRIPTION: Places a magenta line segment connecting (171, 128) to (467, 85).
; PLAN: r0=171(x1), r1=128(y1), r2=467(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 128
LDI r2, 467
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
