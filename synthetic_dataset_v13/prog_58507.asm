; DESCRIPTION: Renders a green line between points (494, 174) and (57, 175).
; PLAN: r0=494(x1), r1=174(y1), r2=57(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 174
LDI r2, 57
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
