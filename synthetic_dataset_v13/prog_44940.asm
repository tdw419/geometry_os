; DESCRIPTION: Draws a black line from (68, 180) to (180, 148).
; PLAN: r0=68(x1), r1=180(y1), r2=180(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 180
LDI r2, 180
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
