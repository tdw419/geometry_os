; DESCRIPTION: Renders a cyan line between points (136, 130) and (290, 0).
; PLAN: r0=136(x1), r1=130(y1), r2=290(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 130
LDI r2, 290
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
