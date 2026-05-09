; DESCRIPTION: Draws a white line from (238, 154) to (235, 123).
; PLAN: r0=238(x1), r1=154(y1), r2=235(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 154
LDI r2, 235
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
