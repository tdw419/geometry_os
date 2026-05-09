; DESCRIPTION: Places a blue circle of radius 46 at center (279, 164).
; PLAN: r0=279(x), r1=164(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 164
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
