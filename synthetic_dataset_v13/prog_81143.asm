; DESCRIPTION: Creates a cyan circular shape at (208, 181) with radius 38.
; PLAN: r0=208(x), r1=181(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 181
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
