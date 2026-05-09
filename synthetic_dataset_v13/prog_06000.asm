; DESCRIPTION: Renders a black line between points (309, 68) and (285, 243).
; PLAN: r0=309(x1), r1=68(y1), r2=285(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 68
LDI r2, 285
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
