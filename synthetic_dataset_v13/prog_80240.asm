; DESCRIPTION: Renders a green line between points (277, 156) and (108, 183).
; PLAN: r0=277(x1), r1=156(y1), r2=108(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 156
LDI r2, 108
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
