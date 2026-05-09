; DESCRIPTION: Draws a green line from (344, 109) to (253, 29).
; PLAN: r0=344(x1), r1=109(y1), r2=253(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 109
LDI r2, 253
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
