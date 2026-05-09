; DESCRIPTION: Draws a black line from (424, 46) to (349, 235).
; PLAN: r0=424(x1), r1=46(y1), r2=349(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 46
LDI r2, 349
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
