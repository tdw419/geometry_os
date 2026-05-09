; DESCRIPTION: Renders a cyan line between points (158, 130) and (248, 31).
; PLAN: r0=158(x1), r1=130(y1), r2=248(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 130
LDI r2, 248
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
