; DESCRIPTION: Creates a cyan circular shape at (148, 131) with radius 27.
; PLAN: r0=148(x), r1=131(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 131
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
