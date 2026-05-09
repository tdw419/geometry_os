; DESCRIPTION: Renders a white line between points (37, 93) and (256, 96).
; PLAN: r0=37(x1), r1=93(y1), r2=256(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 93
LDI r2, 256
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
