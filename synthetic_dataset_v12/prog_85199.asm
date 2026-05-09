; DESCRIPTION: Renders a black line between points (449, 29) and (64, 190).
; PLAN: r0=449(x1), r1=29(y1), r2=64(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 29
LDI r2, 64
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
