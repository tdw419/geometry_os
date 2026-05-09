; DESCRIPTION: Renders a cyan line between points (254, 1) and (208, 11).
; PLAN: r0=254(x1), r1=1(y1), r2=208(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 1
LDI r2, 208
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
