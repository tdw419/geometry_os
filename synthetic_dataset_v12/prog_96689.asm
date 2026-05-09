; DESCRIPTION: Renders a cyan line between points (0, 156) and (455, 136).
; PLAN: r0=0(x1), r1=156(y1), r2=455(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 156
LDI r2, 455
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
