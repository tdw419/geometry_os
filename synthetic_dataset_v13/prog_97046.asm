; DESCRIPTION: Renders a green line between points (500, 131) and (67, 240).
; PLAN: r0=500(x1), r1=131(y1), r2=67(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 131
LDI r2, 67
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
