; DESCRIPTION: Renders a black line between points (480, 167) and (30, 153).
; PLAN: r0=480(x1), r1=167(y1), r2=30(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 167
LDI r2, 30
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
