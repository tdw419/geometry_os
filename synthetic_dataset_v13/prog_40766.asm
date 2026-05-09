; DESCRIPTION: Renders a black line between points (9, 35) and (197, 127).
; PLAN: r0=9(x1), r1=35(y1), r2=197(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 35
LDI r2, 197
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
