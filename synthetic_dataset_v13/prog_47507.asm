; DESCRIPTION: Draws a red line from (308, 129) to (165, 235).
; PLAN: r0=308(x1), r1=129(y1), r2=165(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 129
LDI r2, 165
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
