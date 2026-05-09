; DESCRIPTION: Composite: Creates a yellow circular shape at (313, 32) with radius 16 then Sets a single white pixel at (46, 244).
; PLAN: r0=313(x), r1=32(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=244(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 313
LDI r1, 32
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 244
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
