; DESCRIPTION: Renders a white line between points (88, 42) and (9, 182).
; PLAN: r0=88(x1), r1=42(y1), r2=9(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 42
LDI r2, 9
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
