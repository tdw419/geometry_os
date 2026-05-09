; DESCRIPTION: Places a red line segment connecting (243, 209) to (357, 156).
; PLAN: r0=243(x1), r1=209(y1), r2=357(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 209
LDI r2, 357
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
