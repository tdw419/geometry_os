; DESCRIPTION: Draws a black line from (424, 180) to (50, 161).
; PLAN: r0=424(x1), r1=180(y1), r2=50(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 180
LDI r2, 50
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
