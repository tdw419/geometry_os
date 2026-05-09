; DESCRIPTION: Places a cyan circle of radius 42 at center (223, 58).
; PLAN: r0=223(x), r1=58(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 58
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
