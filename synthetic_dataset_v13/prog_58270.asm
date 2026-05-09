; DESCRIPTION: Renders a black line between points (394, 180) and (265, 148).
; PLAN: r0=394(x1), r1=180(y1), r2=265(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 180
LDI r2, 265
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
