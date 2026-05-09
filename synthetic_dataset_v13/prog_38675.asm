; DESCRIPTION: Places a black line segment connecting (462, 43) to (465, 169).
; PLAN: r0=462(x1), r1=43(y1), r2=465(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 43
LDI r2, 465
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
