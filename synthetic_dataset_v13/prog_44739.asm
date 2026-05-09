; DESCRIPTION: Renders a blue line between points (228, 228) and (68, 96).
; PLAN: r0=228(x1), r1=228(y1), r2=68(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 228
LDI r2, 68
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
