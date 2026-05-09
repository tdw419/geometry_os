; DESCRIPTION: Draws a white line from (100, 165) to (12, 167).
; PLAN: r0=100(x1), r1=165(y1), r2=12(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 165
LDI r2, 12
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
