; DESCRIPTION: Draws a black line from (235, 140) to (408, 42).
; PLAN: r0=235(x1), r1=140(y1), r2=408(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 140
LDI r2, 408
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
