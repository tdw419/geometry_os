; DESCRIPTION: Places a purple circle of radius 78 at center (175, 146).
; PLAN: r0=175(x), r1=146(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 146
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
