; DESCRIPTION: Creates a yellow circular shape at (437, 152) with radius 42.
; PLAN: r0=437(x), r1=152(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 152
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
