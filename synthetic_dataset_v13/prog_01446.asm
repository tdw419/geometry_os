; DESCRIPTION: Renders a cyan line between points (490, 20) and (245, 60).
; PLAN: r0=490(x1), r1=20(y1), r2=245(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 20
LDI r2, 245
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
