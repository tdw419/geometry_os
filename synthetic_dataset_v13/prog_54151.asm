; DESCRIPTION: Renders a black line between points (226, 52) and (173, 10).
; PLAN: r0=226(x1), r1=52(y1), r2=173(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 52
LDI r2, 173
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
