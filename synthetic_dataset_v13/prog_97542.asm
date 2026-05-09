; DESCRIPTION: Renders a black line between points (69, 130) and (104, 166).
; PLAN: r0=69(x1), r1=130(y1), r2=104(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 130
LDI r2, 104
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
