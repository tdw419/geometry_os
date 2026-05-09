; DESCRIPTION: Renders a white line between points (123, 42) and (232, 196).
; PLAN: r0=123(x1), r1=42(y1), r2=232(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 42
LDI r2, 232
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
