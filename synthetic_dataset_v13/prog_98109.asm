; DESCRIPTION: Renders a cyan line between points (55, 37) and (382, 200).
; PLAN: r0=55(x1), r1=37(y1), r2=382(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 37
LDI r2, 382
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
