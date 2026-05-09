; DESCRIPTION: Renders a cyan line between points (56, 138) and (222, 49).
; PLAN: r0=56(x1), r1=138(y1), r2=222(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 138
LDI r2, 222
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
