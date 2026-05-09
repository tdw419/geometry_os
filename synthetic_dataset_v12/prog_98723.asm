; DESCRIPTION: Renders a black line between points (21, 130) and (150, 177).
; PLAN: r0=21(x1), r1=130(y1), r2=150(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 130
LDI r2, 150
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
