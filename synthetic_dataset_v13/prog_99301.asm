; DESCRIPTION: Renders a cyan line between points (509, 198) and (372, 110).
; PLAN: r0=509(x1), r1=198(y1), r2=372(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 198
LDI r2, 372
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
