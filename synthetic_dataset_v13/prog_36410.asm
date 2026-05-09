; DESCRIPTION: Draws a white line from (32, 136) to (301, 167).
; PLAN: r0=32(x1), r1=136(y1), r2=301(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 136
LDI r2, 301
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
