; DESCRIPTION: Renders a blue disk with center (392, 113) and radius 57.
; PLAN: r0=392(x), r1=113(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 113
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
