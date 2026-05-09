; DESCRIPTION: Places a orange line segment connecting (380, 37) to (264, 169).
; PLAN: r0=380(x1), r1=37(y1), r2=264(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 37
LDI r2, 264
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
