; DESCRIPTION: Renders a green line between points (420, 68) and (338, 217).
; PLAN: r0=420(x1), r1=68(y1), r2=338(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 68
LDI r2, 338
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
