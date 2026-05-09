; DESCRIPTION: Renders a black line between points (219, 113) and (469, 213).
; PLAN: r0=219(x1), r1=113(y1), r2=469(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 113
LDI r2, 469
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
