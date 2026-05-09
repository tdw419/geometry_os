; DESCRIPTION: Draws a blue line from (187, 183) to (172, 29).
; PLAN: r0=187(x1), r1=183(y1), r2=172(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 183
LDI r2, 172
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
