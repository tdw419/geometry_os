; DESCRIPTION: Renders a cyan line between points (496, 153) and (301, 1).
; PLAN: r0=496(x1), r1=153(y1), r2=301(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 153
LDI r2, 301
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
