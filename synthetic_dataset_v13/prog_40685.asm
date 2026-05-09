; DESCRIPTION: Renders a blue line between points (288, 221) and (433, 45).
; PLAN: r0=288(x1), r1=221(y1), r2=433(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 221
LDI r2, 433
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
