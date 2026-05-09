; DESCRIPTION: Places a green circle of radius 69 at center (353, 186).
; PLAN: r0=353(x), r1=186(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 186
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
