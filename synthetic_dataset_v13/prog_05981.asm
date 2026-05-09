; DESCRIPTION: Renders a blue line between points (510, 219) and (401, 104).
; PLAN: r0=510(x1), r1=219(y1), r2=401(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 219
LDI r2, 401
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
