; DESCRIPTION: Renders a yellow line between points (207, 246) and (160, 37).
; PLAN: r0=207(x1), r1=246(y1), r2=160(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 246
LDI r2, 160
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
