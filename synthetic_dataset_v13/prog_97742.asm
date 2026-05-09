; DESCRIPTION: Places a orange line segment connecting (57, 242) to (382, 243).
; PLAN: r0=57(x1), r1=242(y1), r2=382(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 242
LDI r2, 382
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
