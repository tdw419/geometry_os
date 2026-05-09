; DESCRIPTION: Renders a red line between points (175, 64) and (455, 6).
; PLAN: r0=175(x1), r1=64(y1), r2=455(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 64
LDI r2, 455
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
