; DESCRIPTION: Renders a white line between points (7, 122) and (227, 42).
; PLAN: r0=7(x1), r1=122(y1), r2=227(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 122
LDI r2, 227
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
