; DESCRIPTION: Renders a green line between points (420, 43) and (401, 121).
; PLAN: r0=420(x1), r1=43(y1), r2=401(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 43
LDI r2, 401
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
