; DESCRIPTION: Renders a yellow line between points (424, 207) and (370, 172).
; PLAN: r0=424(x1), r1=207(y1), r2=370(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 207
LDI r2, 370
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
