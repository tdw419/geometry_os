; DESCRIPTION: Renders a black line between points (173, 63) and (435, 240).
; PLAN: r0=173(x1), r1=63(y1), r2=435(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 63
LDI r2, 435
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
