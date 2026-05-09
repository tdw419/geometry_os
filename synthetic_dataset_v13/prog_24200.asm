; DESCRIPTION: Renders a yellow line between points (256, 93) and (456, 115).
; PLAN: r0=256(x1), r1=93(y1), r2=456(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 93
LDI r2, 456
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
