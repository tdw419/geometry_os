; DESCRIPTION: Draws a white line from (181, 244) to (311, 64).
; PLAN: r0=181(x1), r1=244(y1), r2=311(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 244
LDI r2, 311
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
