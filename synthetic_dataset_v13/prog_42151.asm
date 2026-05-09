; DESCRIPTION: Renders a cyan line between points (12, 185) and (244, 3).
; PLAN: r0=12(x1), r1=185(y1), r2=244(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 185
LDI r2, 244
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
