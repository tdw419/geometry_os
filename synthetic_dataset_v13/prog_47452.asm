; DESCRIPTION: Creates a yellow circular shape at (295, 193) with radius 61.
; PLAN: r0=295(x), r1=193(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 193
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
