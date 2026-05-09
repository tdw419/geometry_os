; DESCRIPTION: Renders a white line between points (401, 227) and (383, 65).
; PLAN: r0=401(x1), r1=227(y1), r2=383(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 227
LDI r2, 383
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
