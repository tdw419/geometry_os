; DESCRIPTION: Draws a black line from (360, 12) to (94, 69).
; PLAN: r0=360(x1), r1=12(y1), r2=94(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 12
LDI r2, 94
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
