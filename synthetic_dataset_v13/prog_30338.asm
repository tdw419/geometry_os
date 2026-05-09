; DESCRIPTION: Creates a cyan circular shape at (429, 46) with radius 29.
; PLAN: r0=429(x), r1=46(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 46
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
