; DESCRIPTION: Renders a black line between points (494, 33) and (492, 169).
; PLAN: r0=494(x1), r1=33(y1), r2=492(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 33
LDI r2, 492
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
