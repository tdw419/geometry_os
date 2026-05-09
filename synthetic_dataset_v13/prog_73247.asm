; DESCRIPTION: Draws a black line from (505, 10) to (171, 133).
; PLAN: r0=505(x1), r1=10(y1), r2=171(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 10
LDI r2, 171
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
