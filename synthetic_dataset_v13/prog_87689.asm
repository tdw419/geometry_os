; DESCRIPTION: Renders a yellow line between points (78, 237) and (502, 172).
; PLAN: r0=78(x1), r1=237(y1), r2=502(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 237
LDI r2, 502
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
