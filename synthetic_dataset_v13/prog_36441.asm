; DESCRIPTION: Creates a cyan circular shape at (408, 90) with radius 10.
; PLAN: r0=408(x), r1=90(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 90
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
