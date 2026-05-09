; DESCRIPTION: Renders a white line between points (268, 68) and (101, 122).
; PLAN: r0=268(x1), r1=68(y1), r2=101(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 68
LDI r2, 101
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
