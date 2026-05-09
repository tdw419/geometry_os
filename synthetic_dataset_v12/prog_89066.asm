; DESCRIPTION: Renders a red line between points (499, 160) and (326, 100).
; PLAN: r0=499(x1), r1=160(y1), r2=326(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 160
LDI r2, 326
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
