; DESCRIPTION: Renders a cyan line between points (490, 138) and (266, 175).
; PLAN: r0=490(x1), r1=138(y1), r2=266(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 138
LDI r2, 266
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
