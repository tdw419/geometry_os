; DESCRIPTION: Renders a black line between points (289, 93) and (335, 231).
; PLAN: r0=289(x1), r1=93(y1), r2=335(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 93
LDI r2, 335
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
