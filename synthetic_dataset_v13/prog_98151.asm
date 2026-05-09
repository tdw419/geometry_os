; DESCRIPTION: Renders a red line between points (397, 229) and (271, 95).
; PLAN: r0=397(x1), r1=229(y1), r2=271(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 229
LDI r2, 271
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
