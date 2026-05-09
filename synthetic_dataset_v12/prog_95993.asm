; DESCRIPTION: Draws a cyan circle centered at (456, 164) with radius 16.
; PLAN: r0=456(x), r1=164(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 164
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
