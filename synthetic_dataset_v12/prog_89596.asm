; DESCRIPTION: Places a cyan circle of radius 53 at center (284, 152).
; PLAN: r0=284(x), r1=152(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 152
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
