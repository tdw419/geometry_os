; DESCRIPTION: Places a white circle of radius 68 at center (209, 188).
; PLAN: r0=209(x), r1=188(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 188
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
