; DESCRIPTION: Creates a cyan circular shape at (91, 116) with radius 58.
; PLAN: r0=91(x), r1=116(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 116
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
