; DESCRIPTION: Creates a yellow circular shape at (410, 119) with radius 16.
; PLAN: r0=410(x), r1=119(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 119
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
