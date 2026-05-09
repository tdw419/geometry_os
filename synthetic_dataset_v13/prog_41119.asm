; DESCRIPTION: Renders a red line between points (492, 218) and (329, 60).
; PLAN: r0=492(x1), r1=218(y1), r2=329(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 218
LDI r2, 329
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
