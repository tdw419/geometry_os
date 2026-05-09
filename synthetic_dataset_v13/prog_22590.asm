; DESCRIPTION: Draws a cyan circle centered at (93, 221) with radius 10.
; PLAN: r0=93(x), r1=221(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 221
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
