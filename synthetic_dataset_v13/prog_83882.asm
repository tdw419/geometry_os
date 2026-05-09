; DESCRIPTION: Draws a green line from (253, 115) to (105, 170).
; PLAN: r0=253(x1), r1=115(y1), r2=105(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 115
LDI r2, 105
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
