; DESCRIPTION: Draws a green line from (307, 227) to (105, 253).
; PLAN: r0=307(x1), r1=227(y1), r2=105(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 227
LDI r2, 105
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
