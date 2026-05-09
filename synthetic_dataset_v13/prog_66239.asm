; DESCRIPTION: Renders a white line between points (178, 148) and (211, 13).
; PLAN: r0=178(x1), r1=148(y1), r2=211(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 148
LDI r2, 211
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
