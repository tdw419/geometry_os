; DESCRIPTION: Places a black circle of radius 36 at center (231, 42).
; PLAN: r0=231(x), r1=42(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 42
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
