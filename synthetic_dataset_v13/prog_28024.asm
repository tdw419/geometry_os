; DESCRIPTION: Places a magenta line segment connecting (288, 31) to (444, 27).
; PLAN: r0=288(x1), r1=31(y1), r2=444(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 31
LDI r2, 444
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
