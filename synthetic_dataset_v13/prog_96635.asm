; DESCRIPTION: Creates a cyan circular shape at (269, 97) with radius 70.
; PLAN: r0=269(x), r1=97(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 97
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
