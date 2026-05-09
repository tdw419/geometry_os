; DESCRIPTION: Draws a green line from (111, 183) to (453, 223).
; PLAN: r0=111(x1), r1=183(y1), r2=453(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 183
LDI r2, 453
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
