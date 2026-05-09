; DESCRIPTION: Renders a cyan line between points (300, 130) and (470, 252).
; PLAN: r0=300(x1), r1=130(y1), r2=470(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 130
LDI r2, 470
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
