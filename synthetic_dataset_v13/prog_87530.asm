; DESCRIPTION: Renders a yellow line between points (213, 183) and (206, 176).
; PLAN: r0=213(x1), r1=183(y1), r2=206(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 183
LDI r2, 206
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
