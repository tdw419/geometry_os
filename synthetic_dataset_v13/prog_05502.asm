; DESCRIPTION: Draws a cyan circle centered at (42, 175) with radius 27.
; PLAN: r0=42(x), r1=175(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 175
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
