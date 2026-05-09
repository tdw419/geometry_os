; DESCRIPTION: Renders a cyan line between points (397, 155) and (289, 22).
; PLAN: r0=397(x1), r1=155(y1), r2=289(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 155
LDI r2, 289
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
