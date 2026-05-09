; DESCRIPTION: Renders a red line between points (187, 84) and (397, 21).
; PLAN: r0=187(x1), r1=84(y1), r2=397(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 84
LDI r2, 397
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
