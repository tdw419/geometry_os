; DESCRIPTION: Places a black line segment connecting (243, 125) to (345, 156).
; PLAN: r0=243(x1), r1=125(y1), r2=345(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 125
LDI r2, 345
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
