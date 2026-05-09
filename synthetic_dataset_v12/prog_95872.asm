; DESCRIPTION: Draws a red line from (326, 40) to (235, 42).
; PLAN: r0=326(x1), r1=40(y1), r2=235(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 40
LDI r2, 235
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
