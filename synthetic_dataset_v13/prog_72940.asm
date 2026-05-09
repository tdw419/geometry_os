; DESCRIPTION: Renders a white line between points (499, 219) and (117, 157).
; PLAN: r0=499(x1), r1=219(y1), r2=117(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 219
LDI r2, 117
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
