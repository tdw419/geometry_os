; DESCRIPTION: Renders a white line between points (416, 52) and (168, 232).
; PLAN: r0=416(x1), r1=52(y1), r2=168(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 52
LDI r2, 168
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
