; DESCRIPTION: Places a blue circle of radius 29 at center (391, 174).
; PLAN: r0=391(x), r1=174(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 174
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
