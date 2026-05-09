; DESCRIPTION: Renders a green line between points (499, 248) and (1, 49).
; PLAN: r0=499(x1), r1=248(y1), r2=1(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 248
LDI r2, 1
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
