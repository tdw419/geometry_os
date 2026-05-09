; DESCRIPTION: Renders a cyan line between points (318, 141) and (337, 101).
; PLAN: r0=318(x1), r1=141(y1), r2=337(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 141
LDI r2, 337
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
