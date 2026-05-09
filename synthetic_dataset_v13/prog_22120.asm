; DESCRIPTION: Places a black circle of radius 20 at center (328, 178).
; PLAN: r0=328(x), r1=178(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 178
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
