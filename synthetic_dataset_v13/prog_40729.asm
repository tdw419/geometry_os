; DESCRIPTION: Renders a black line between points (294, 55) and (383, 238).
; PLAN: r0=294(x1), r1=55(y1), r2=383(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 55
LDI r2, 383
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
