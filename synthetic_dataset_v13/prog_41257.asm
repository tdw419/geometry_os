; DESCRIPTION: Draws a white line from (235, 168) to (299, 12).
; PLAN: r0=235(x1), r1=168(y1), r2=299(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 168
LDI r2, 299
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
