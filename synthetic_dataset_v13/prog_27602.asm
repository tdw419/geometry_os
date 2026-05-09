; DESCRIPTION: Renders a cyan line between points (65, 155) and (418, 247).
; PLAN: r0=65(x1), r1=155(y1), r2=418(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 155
LDI r2, 418
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
