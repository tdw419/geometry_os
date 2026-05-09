; DESCRIPTION: Renders a black line between points (270, 183) and (4, 215).
; PLAN: r0=270(x1), r1=183(y1), r2=4(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 183
LDI r2, 4
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
