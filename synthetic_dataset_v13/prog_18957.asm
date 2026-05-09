; DESCRIPTION: Renders a cyan line between points (463, 17) and (290, 73).
; PLAN: r0=463(x1), r1=17(y1), r2=290(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 17
LDI r2, 290
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
