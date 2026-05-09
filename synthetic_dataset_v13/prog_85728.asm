; DESCRIPTION: Renders a purple line between points (401, 244) and (31, 65).
; PLAN: r0=401(x1), r1=244(y1), r2=31(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 244
LDI r2, 31
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
