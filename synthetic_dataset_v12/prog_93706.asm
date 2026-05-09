; DESCRIPTION: Renders a yellow line between points (56, 249) and (217, 50).
; PLAN: r0=56(x1), r1=249(y1), r2=217(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 249
LDI r2, 217
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
