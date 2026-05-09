; DESCRIPTION: Renders a black line between points (59, 126) and (391, 123).
; PLAN: r0=59(x1), r1=126(y1), r2=391(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 126
LDI r2, 391
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
