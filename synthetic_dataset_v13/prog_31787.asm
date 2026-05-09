; DESCRIPTION: Renders a blue disk with center (108, 186) and radius 32.
; PLAN: r0=108(x), r1=186(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 186
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
