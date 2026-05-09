; DESCRIPTION: Renders a black line between points (109, 221) and (123, 55).
; PLAN: r0=109(x1), r1=221(y1), r2=123(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 221
LDI r2, 123
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
