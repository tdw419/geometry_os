; DESCRIPTION: Renders a purple line between points (401, 223) and (371, 120).
; PLAN: r0=401(x1), r1=223(y1), r2=371(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 223
LDI r2, 371
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
