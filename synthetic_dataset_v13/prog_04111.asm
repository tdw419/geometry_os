; DESCRIPTION: Creates a cyan circular shape at (220, 91) with radius 73.
; PLAN: r0=220(x), r1=91(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 91
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
