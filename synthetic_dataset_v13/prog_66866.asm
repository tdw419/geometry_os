; DESCRIPTION: Renders a green line between points (419, 83) and (501, 113).
; PLAN: r0=419(x1), r1=83(y1), r2=501(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 83
LDI r2, 501
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
