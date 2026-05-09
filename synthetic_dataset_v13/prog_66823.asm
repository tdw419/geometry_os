; DESCRIPTION: Creates a cyan circular shape at (121, 50) with radius 29.
; PLAN: r0=121(x), r1=50(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 50
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
