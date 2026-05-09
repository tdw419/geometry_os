; DESCRIPTION: Renders a yellow line between points (315, 15) and (394, 114).
; PLAN: r0=315(x1), r1=15(y1), r2=394(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 15
LDI r2, 394
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
