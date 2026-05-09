; DESCRIPTION: Renders a green line between points (420, 233) and (16, 88).
; PLAN: r0=420(x1), r1=233(y1), r2=16(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 233
LDI r2, 16
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
