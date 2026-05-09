; DESCRIPTION: Renders a white line between points (206, 123) and (105, 242).
; PLAN: r0=206(x1), r1=123(y1), r2=105(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 123
LDI r2, 105
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
