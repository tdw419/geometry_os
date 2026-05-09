; DESCRIPTION: Renders a yellow line between points (151, 176) and (258, 178).
; PLAN: r0=151(x1), r1=176(y1), r2=258(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 176
LDI r2, 258
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
