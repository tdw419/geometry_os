; DESCRIPTION: Draws a yellow line from (172, 165) to (167, 19).
; PLAN: r0=172(x1), r1=165(y1), r2=167(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 165
LDI r2, 167
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
