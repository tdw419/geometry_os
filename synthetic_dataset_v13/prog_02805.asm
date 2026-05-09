; DESCRIPTION: Places a green circle of radius 69 at center (276, 170).
; PLAN: r0=276(x), r1=170(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 170
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
