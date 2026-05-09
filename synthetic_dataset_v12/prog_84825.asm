; DESCRIPTION: Places a magenta line segment connecting (229, 253) to (151, 50).
; PLAN: r0=229(x1), r1=253(y1), r2=151(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 253
LDI r2, 151
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
