; DESCRIPTION: Renders a black line between points (12, 151) and (220, 190).
; PLAN: r0=12(x1), r1=151(y1), r2=220(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 151
LDI r2, 220
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
