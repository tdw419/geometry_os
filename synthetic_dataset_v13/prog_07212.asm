; DESCRIPTION: Renders a cyan line between points (397, 70) and (125, 22).
; PLAN: r0=397(x1), r1=70(y1), r2=125(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 70
LDI r2, 125
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
