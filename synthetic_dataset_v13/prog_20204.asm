; DESCRIPTION: Places a orange line segment connecting (264, 230) to (465, 69).
; PLAN: r0=264(x1), r1=230(y1), r2=465(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 230
LDI r2, 465
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
