; DESCRIPTION: Draws a yellow line from (399, 210) to (456, 252).
; PLAN: r0=399(x1), r1=210(y1), r2=456(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 210
LDI r2, 456
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
