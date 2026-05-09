; DESCRIPTION: Renders a black line between points (499, 95) and (324, 103).
; PLAN: r0=499(x1), r1=95(y1), r2=324(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 95
LDI r2, 324
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
