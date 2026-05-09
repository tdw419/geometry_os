; DESCRIPTION: Draws a orange line from (321, 177) to (256, 167).
; PLAN: r0=321(x1), r1=177(y1), r2=256(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 177
LDI r2, 256
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
