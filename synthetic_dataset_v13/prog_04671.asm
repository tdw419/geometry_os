; DESCRIPTION: Creates a cyan circular shape at (55, 154) with radius 36.
; PLAN: r0=55(x), r1=154(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 154
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
