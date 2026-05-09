; DESCRIPTION: Renders a white line between points (354, 252) and (191, 3).
; PLAN: r0=354(x1), r1=252(y1), r2=191(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 252
LDI r2, 191
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
