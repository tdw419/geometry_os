; DESCRIPTION: Renders a blue disk with center (398, 178) and radius 68.
; PLAN: r0=398(x), r1=178(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 178
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
