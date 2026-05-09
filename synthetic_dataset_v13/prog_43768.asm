; DESCRIPTION: Places a yellow circle of radius 40 at center (146, 155).
; PLAN: r0=146(x), r1=155(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 155
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
