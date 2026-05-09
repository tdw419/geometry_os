; DESCRIPTION: Renders a black line between points (202, 64) and (493, 254).
; PLAN: r0=202(x1), r1=64(y1), r2=493(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 64
LDI r2, 493
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
