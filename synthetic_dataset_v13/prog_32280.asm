; DESCRIPTION: Renders a green line between points (15, 243) and (96, 143).
; PLAN: r0=15(x1), r1=243(y1), r2=96(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 243
LDI r2, 96
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
