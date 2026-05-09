; DESCRIPTION: Renders a white line between points (312, 221) and (273, 60).
; PLAN: r0=312(x1), r1=221(y1), r2=273(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 221
LDI r2, 273
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
