; DESCRIPTION: Draws a cyan circle centered at (210, 134) with radius 58.
; PLAN: r0=210(x), r1=134(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 134
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
