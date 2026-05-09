; DESCRIPTION: Draws a yellow line from (466, 73) to (311, 16).
; PLAN: r0=466(x1), r1=73(y1), r2=311(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 73
LDI r2, 311
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
