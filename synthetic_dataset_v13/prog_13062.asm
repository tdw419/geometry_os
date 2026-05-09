; DESCRIPTION: Renders a black line between points (383, 207) and (168, 78).
; PLAN: r0=383(x1), r1=207(y1), r2=168(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 207
LDI r2, 168
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
