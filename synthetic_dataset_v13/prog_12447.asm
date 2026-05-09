; DESCRIPTION: Renders a black line between points (68, 176) and (209, 55).
; PLAN: r0=68(x1), r1=176(y1), r2=209(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 176
LDI r2, 209
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
