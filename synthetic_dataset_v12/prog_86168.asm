; DESCRIPTION: Renders a black line between points (62, 240) and (82, 127).
; PLAN: r0=62(x1), r1=240(y1), r2=82(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 240
LDI r2, 82
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
