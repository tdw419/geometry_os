; DESCRIPTION: Places a magenta line segment connecting (346, 183) to (160, 136).
; PLAN: r0=346(x1), r1=183(y1), r2=160(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 183
LDI r2, 160
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
