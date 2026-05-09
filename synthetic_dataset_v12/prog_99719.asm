; DESCRIPTION: Renders a cyan line between points (454, 199) and (185, 250).
; PLAN: r0=454(x1), r1=199(y1), r2=185(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 199
LDI r2, 185
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
