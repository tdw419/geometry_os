; DESCRIPTION: Places a black line segment connecting (243, 119) to (50, 165).
; PLAN: r0=243(x1), r1=119(y1), r2=50(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 119
LDI r2, 50
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
