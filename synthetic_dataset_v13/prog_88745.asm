; DESCRIPTION: Draws a green line from (498, 167) to (124, 1).
; PLAN: r0=498(x1), r1=167(y1), r2=124(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 167
LDI r2, 124
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
