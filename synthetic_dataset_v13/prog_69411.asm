; DESCRIPTION: Places a cyan circle of radius 10 at center (284, 123).
; PLAN: r0=284(x), r1=123(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 123
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
