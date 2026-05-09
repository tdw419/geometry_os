; DESCRIPTION: Renders a cyan line between points (40, 10) and (254, 159).
; PLAN: r0=40(x1), r1=10(y1), r2=254(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 10
LDI r2, 254
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
