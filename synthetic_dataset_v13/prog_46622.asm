; DESCRIPTION: Draws a cyan circle centered at (142, 221) with radius 29.
; PLAN: r0=142(x), r1=221(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 221
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
