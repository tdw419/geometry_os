; DESCRIPTION: Places a yellow circle of radius 65 at center (303, 170).
; PLAN: r0=303(x), r1=170(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 170
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
