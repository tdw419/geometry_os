; DESCRIPTION: Places a magenta line segment connecting (79, 224) to (321, 95).
; PLAN: r0=79(x1), r1=224(y1), r2=321(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 224
LDI r2, 321
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
