; DESCRIPTION: Draws a white line from (490, 149) to (21, 118).
; PLAN: r0=490(x1), r1=149(y1), r2=21(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 149
LDI r2, 21
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
