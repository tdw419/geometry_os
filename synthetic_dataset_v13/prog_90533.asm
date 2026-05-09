; DESCRIPTION: Renders a black line between points (278, 128) and (219, 173).
; PLAN: r0=278(x1), r1=128(y1), r2=219(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 128
LDI r2, 219
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
