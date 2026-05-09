; DESCRIPTION: Places a blue line segment connecting (380, 48) to (50, 119).
; PLAN: r0=380(x1), r1=48(y1), r2=50(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 48
LDI r2, 50
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
