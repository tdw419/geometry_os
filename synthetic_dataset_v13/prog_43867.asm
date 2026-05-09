; DESCRIPTION: Places a black circle of radius 53 at center (284, 126).
; PLAN: r0=284(x), r1=126(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 126
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
