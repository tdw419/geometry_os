; DESCRIPTION: Renders a black line between points (401, 233) and (135, 58).
; PLAN: r0=401(x1), r1=233(y1), r2=135(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 233
LDI r2, 135
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
