; DESCRIPTION: Places a red circle of radius 21 at center (402, 178).
; PLAN: r0=402(x), r1=178(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 178
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
