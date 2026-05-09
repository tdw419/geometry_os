; DESCRIPTION: Renders a blue line between points (342, 16) and (271, 19).
; PLAN: r0=342(x1), r1=16(y1), r2=271(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 16
LDI r2, 271
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
