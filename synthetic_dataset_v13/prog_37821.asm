; DESCRIPTION: Renders a blue line between points (425, 157) and (45, 38).
; PLAN: r0=425(x1), r1=157(y1), r2=45(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 157
LDI r2, 45
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
