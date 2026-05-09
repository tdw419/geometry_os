; DESCRIPTION: Renders a green line between points (75, 15) and (397, 44).
; PLAN: r0=75(x1), r1=15(y1), r2=397(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 15
LDI r2, 397
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
