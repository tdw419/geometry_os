; DESCRIPTION: Places a red line segment connecting (361, 235) to (387, 131).
; PLAN: r0=361(x1), r1=235(y1), r2=387(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 235
LDI r2, 387
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
