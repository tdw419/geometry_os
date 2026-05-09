; DESCRIPTION: Renders a green line between points (114, 35) and (183, 249).
; PLAN: r0=114(x1), r1=35(y1), r2=183(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 35
LDI r2, 183
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
