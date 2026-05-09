; DESCRIPTION: Renders a blue line between points (176, 60) and (500, 42).
; PLAN: r0=176(x1), r1=60(y1), r2=500(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 60
LDI r2, 500
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
