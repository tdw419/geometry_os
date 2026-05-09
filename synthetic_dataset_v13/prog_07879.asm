; DESCRIPTION: Renders a black line between points (209, 39) and (21, 79).
; PLAN: r0=209(x1), r1=39(y1), r2=21(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 39
LDI r2, 21
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
