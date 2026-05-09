; DESCRIPTION: Draws a blue line from (151, 31) to (86, 187).
; PLAN: r0=151(x1), r1=31(y1), r2=86(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 31
LDI r2, 86
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
