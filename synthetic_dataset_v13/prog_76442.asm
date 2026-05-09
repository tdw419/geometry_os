; DESCRIPTION: Renders a black line between points (9, 166) and (117, 153).
; PLAN: r0=9(x1), r1=166(y1), r2=117(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 166
LDI r2, 117
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
