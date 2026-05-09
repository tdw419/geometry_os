; DESCRIPTION: Places a green circle of radius 52 at center (314, 174).
; PLAN: r0=314(x), r1=174(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 174
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
