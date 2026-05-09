; DESCRIPTION: Renders a cyan line between points (66, 1) and (402, 158).
; PLAN: r0=66(x1), r1=1(y1), r2=402(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 1
LDI r2, 402
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
