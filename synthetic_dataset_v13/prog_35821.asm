; DESCRIPTION: Renders a green line between points (503, 222) and (401, 118).
; PLAN: r0=503(x1), r1=222(y1), r2=401(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 222
LDI r2, 401
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
