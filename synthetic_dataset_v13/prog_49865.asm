; DESCRIPTION: Places a magenta line segment connecting (361, 244) to (294, 163).
; PLAN: r0=361(x1), r1=244(y1), r2=294(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 244
LDI r2, 294
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
