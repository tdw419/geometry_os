; DESCRIPTION: Creates a cyan circular shape at (465, 99) with radius 37.
; PLAN: r0=465(x), r1=99(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 99
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
