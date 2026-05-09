; DESCRIPTION: Renders a cyan line between points (44, 181) and (232, 244).
; PLAN: r0=44(x1), r1=181(y1), r2=232(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 181
LDI r2, 232
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
