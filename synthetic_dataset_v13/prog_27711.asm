; DESCRIPTION: Renders a black line between points (113, 164) and (278, 181).
; PLAN: r0=113(x1), r1=164(y1), r2=278(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 164
LDI r2, 278
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
