; DESCRIPTION: Renders a cyan line between points (251, 29) and (283, 18).
; PLAN: r0=251(x1), r1=29(y1), r2=283(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 29
LDI r2, 283
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
