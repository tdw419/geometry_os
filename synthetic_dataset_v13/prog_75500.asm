; DESCRIPTION: Draws a cyan circle centered at (243, 42) with radius 19.
; PLAN: r0=243(x), r1=42(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 42
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
