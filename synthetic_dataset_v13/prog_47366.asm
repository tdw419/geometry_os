; DESCRIPTION: Renders a cyan line between points (55, 153) and (84, 115).
; PLAN: r0=55(x1), r1=153(y1), r2=84(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 153
LDI r2, 84
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
