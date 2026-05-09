; DESCRIPTION: Places a magenta line segment connecting (157, 171) to (354, 14).
; PLAN: r0=157(x1), r1=171(y1), r2=354(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 171
LDI r2, 354
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
