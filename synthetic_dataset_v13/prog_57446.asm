; DESCRIPTION: Renders a white line between points (123, 60) and (186, 8).
; PLAN: r0=123(x1), r1=60(y1), r2=186(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 60
LDI r2, 186
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
