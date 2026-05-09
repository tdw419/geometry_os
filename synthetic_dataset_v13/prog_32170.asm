; DESCRIPTION: Places a green circle of radius 65 at center (385, 103).
; PLAN: r0=385(x), r1=103(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 103
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
