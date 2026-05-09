; DESCRIPTION: Renders a green line between points (313, 4) and (188, 183).
; PLAN: r0=313(x1), r1=4(y1), r2=188(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 4
LDI r2, 188
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
