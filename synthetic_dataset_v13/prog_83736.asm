; DESCRIPTION: Places a magenta line segment connecting (377, 134) to (272, 239).
; PLAN: r0=377(x1), r1=134(y1), r2=272(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 134
LDI r2, 272
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
