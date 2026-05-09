; DESCRIPTION: Creates a yellow circular shape at (337, 221) with radius 28.
; PLAN: r0=337(x), r1=221(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 221
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
