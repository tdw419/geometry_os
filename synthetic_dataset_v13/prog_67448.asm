; DESCRIPTION: Draws a black line from (510, 179) to (171, 105).
; PLAN: r0=510(x1), r1=179(y1), r2=171(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 179
LDI r2, 171
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
