; DESCRIPTION: Draws a blue line from (187, 96) to (208, 118).
; PLAN: r0=187(x1), r1=96(y1), r2=208(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 96
LDI r2, 208
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
