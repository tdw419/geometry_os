; DESCRIPTION: Places a magenta line segment connecting (465, 73) to (329, 224).
; PLAN: r0=465(x1), r1=73(y1), r2=329(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 73
LDI r2, 329
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
