; DESCRIPTION: Draws a black line from (164, 74) to (143, 5).
; PLAN: r0=164(x1), r1=74(y1), r2=143(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 74
LDI r2, 143
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
