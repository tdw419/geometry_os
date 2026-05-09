; DESCRIPTION: Renders a cyan line between points (109, 232) and (435, 200).
; PLAN: r0=109(x1), r1=232(y1), r2=435(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 232
LDI r2, 435
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
