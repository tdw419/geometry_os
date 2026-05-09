; DESCRIPTION: Renders a green line between points (67, 38) and (29, 163).
; PLAN: r0=67(x1), r1=38(y1), r2=29(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 38
LDI r2, 29
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
