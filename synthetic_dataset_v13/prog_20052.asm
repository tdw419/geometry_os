; DESCRIPTION: Places a red line segment connecting (39, 52) to (282, 107).
; PLAN: r0=39(x1), r1=52(y1), r2=282(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 52
LDI r2, 282
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
