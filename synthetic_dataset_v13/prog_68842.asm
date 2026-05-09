; DESCRIPTION: Creates a cyan circular shape at (340, 87) with radius 27.
; PLAN: r0=340(x), r1=87(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 87
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
