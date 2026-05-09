; DESCRIPTION: Places a black line segment connecting (380, 74) to (90, 243).
; PLAN: r0=380(x1), r1=74(y1), r2=90(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 74
LDI r2, 90
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
