; DESCRIPTION: Places a white circle of radius 48 at center (303, 186).
; PLAN: r0=303(x), r1=186(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 186
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
