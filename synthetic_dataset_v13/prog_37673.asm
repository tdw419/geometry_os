; DESCRIPTION: Renders a cyan line between points (375, 130) and (194, 230).
; PLAN: r0=375(x1), r1=130(y1), r2=194(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 130
LDI r2, 194
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
