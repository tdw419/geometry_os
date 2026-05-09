; DESCRIPTION: Renders a red line between points (386, 19) and (176, 219).
; PLAN: r0=386(x1), r1=19(y1), r2=176(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 19
LDI r2, 176
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
