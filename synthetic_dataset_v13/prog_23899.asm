; DESCRIPTION: Renders a green line between points (241, 73) and (465, 6).
; PLAN: r0=241(x1), r1=73(y1), r2=465(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 73
LDI r2, 465
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
