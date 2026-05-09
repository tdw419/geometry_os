; DESCRIPTION: Renders a cyan line between points (452, 153) and (130, 77).
; PLAN: r0=452(x1), r1=153(y1), r2=130(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 153
LDI r2, 130
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
