; DESCRIPTION: Renders a green line between points (39, 218) and (220, 1).
; PLAN: r0=39(x1), r1=218(y1), r2=220(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 218
LDI r2, 220
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
