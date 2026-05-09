; DESCRIPTION: Draws a cyan circle centered at (168, 193) with radius 35.
; PLAN: r0=168(x), r1=193(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 193
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
