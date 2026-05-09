; DESCRIPTION: Renders a yellow line between points (416, 166) and (207, 161).
; PLAN: r0=416(x1), r1=166(y1), r2=207(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 166
LDI r2, 207
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
