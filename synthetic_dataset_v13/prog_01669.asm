; DESCRIPTION: Draws a black line from (298, 180) to (411, 235).
; PLAN: r0=298(x1), r1=180(y1), r2=411(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 180
LDI r2, 411
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
