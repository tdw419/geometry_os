; DESCRIPTION: Creates a cyan circular shape at (149, 152) with radius 58.
; PLAN: r0=149(x), r1=152(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 152
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
