; DESCRIPTION: Renders a cyan line between points (354, 54) and (288, 119).
; PLAN: r0=354(x1), r1=54(y1), r2=288(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 54
LDI r2, 288
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
