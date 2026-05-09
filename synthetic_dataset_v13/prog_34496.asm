; DESCRIPTION: Renders a cyan line between points (495, 123) and (421, 137).
; PLAN: r0=495(x1), r1=123(y1), r2=421(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 123
LDI r2, 421
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
