; DESCRIPTION: Places a magenta line segment connecting (3, 148) to (320, 7).
; PLAN: r0=3(x1), r1=148(y1), r2=320(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 148
LDI r2, 320
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
