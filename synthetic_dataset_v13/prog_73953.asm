; DESCRIPTION: Renders a blue disk with center (173, 16) and radius 12.
; PLAN: r0=173(x), r1=16(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 16
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
