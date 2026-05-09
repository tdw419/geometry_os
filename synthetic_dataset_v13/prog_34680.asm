; DESCRIPTION: Renders a black line between points (433, 176) and (467, 0).
; PLAN: r0=433(x1), r1=176(y1), r2=467(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 176
LDI r2, 467
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
