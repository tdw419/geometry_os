; DESCRIPTION: Renders a white line between points (175, 68) and (182, 26).
; PLAN: r0=175(x1), r1=68(y1), r2=182(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 68
LDI r2, 182
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
