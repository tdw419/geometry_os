; DESCRIPTION: Renders a yellow line between points (303, 122) and (178, 53).
; PLAN: r0=303(x1), r1=122(y1), r2=178(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 122
LDI r2, 178
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
