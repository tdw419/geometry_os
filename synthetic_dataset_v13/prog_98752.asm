; DESCRIPTION: Renders a black line between points (281, 164) and (285, 144).
; PLAN: r0=281(x1), r1=164(y1), r2=285(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 164
LDI r2, 285
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
