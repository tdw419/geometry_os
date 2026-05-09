; DESCRIPTION: Draws a cyan circle centered at (279, 42) with radius 32.
; PLAN: r0=279(x), r1=42(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 42
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
