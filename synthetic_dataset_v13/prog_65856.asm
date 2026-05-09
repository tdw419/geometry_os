; DESCRIPTION: Creates a cyan circular shape at (187, 174) with radius 73.
; PLAN: r0=187(x), r1=174(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 174
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
