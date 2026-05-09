; DESCRIPTION: Renders a blue disk with center (202, 198) and radius 27.
; PLAN: r0=202(x), r1=198(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 198
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
