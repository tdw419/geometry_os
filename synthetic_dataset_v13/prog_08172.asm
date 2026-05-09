; DESCRIPTION: Places a blue circle of radius 65 at center (436, 146).
; PLAN: r0=436(x), r1=146(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 146
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
