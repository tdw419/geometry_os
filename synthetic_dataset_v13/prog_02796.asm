; DESCRIPTION: Places a magenta line segment connecting (365, 249) to (4, 175).
; PLAN: r0=365(x1), r1=249(y1), r2=4(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 249
LDI r2, 4
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
