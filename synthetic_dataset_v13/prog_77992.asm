; DESCRIPTION: Places a cyan circle of radius 32 at center (329, 198).
; PLAN: r0=329(x), r1=198(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 198
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
