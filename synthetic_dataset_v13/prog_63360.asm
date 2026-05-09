; DESCRIPTION: Creates a cyan circular shape at (187, 74) with radius 32.
; PLAN: r0=187(x), r1=74(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 74
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
