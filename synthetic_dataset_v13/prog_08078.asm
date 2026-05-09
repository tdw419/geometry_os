; DESCRIPTION: Creates a cyan circular shape at (317, 153) with radius 52.
; PLAN: r0=317(x), r1=153(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 153
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
