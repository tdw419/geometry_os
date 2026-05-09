; DESCRIPTION: Draws a cyan circle centered at (456, 93) with radius 42.
; PLAN: r0=456(x), r1=93(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 93
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
