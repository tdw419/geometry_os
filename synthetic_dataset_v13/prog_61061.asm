; DESCRIPTION: Draws a black line from (73, 167) to (57, 129).
; PLAN: r0=73(x1), r1=167(y1), r2=57(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 167
LDI r2, 57
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
