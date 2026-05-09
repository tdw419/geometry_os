; DESCRIPTION: Renders a yellow line between points (444, 230) and (313, 186).
; PLAN: r0=444(x1), r1=230(y1), r2=313(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 230
LDI r2, 313
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
