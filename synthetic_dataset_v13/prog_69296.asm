; DESCRIPTION: Draws a cyan circle centered at (327, 195) with radius 58.
; PLAN: r0=327(x), r1=195(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 195
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
