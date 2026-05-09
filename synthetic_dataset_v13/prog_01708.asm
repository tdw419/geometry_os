; DESCRIPTION: Places a magenta line segment connecting (502, 244) to (496, 132).
; PLAN: r0=502(x1), r1=244(y1), r2=496(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 244
LDI r2, 496
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
