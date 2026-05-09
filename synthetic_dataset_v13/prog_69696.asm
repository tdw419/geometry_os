; DESCRIPTION: Creates a yellow circular shape at (193, 173) with radius 38.
; PLAN: r0=193(x), r1=173(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 173
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
