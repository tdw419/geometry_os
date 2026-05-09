; DESCRIPTION: Renders a magenta line between points (298, 17) and (243, 130).
; PLAN: r0=298(x1), r1=17(y1), r2=243(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 17
LDI r2, 243
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
