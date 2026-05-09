; DESCRIPTION: Renders a cyan line between points (47, 130) and (94, 55).
; PLAN: r0=47(x1), r1=130(y1), r2=94(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 130
LDI r2, 94
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
