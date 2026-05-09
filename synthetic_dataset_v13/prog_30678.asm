; DESCRIPTION: Renders a blue line between points (53, 204) and (352, 69).
; PLAN: r0=53(x1), r1=204(y1), r2=352(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 204
LDI r2, 352
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
