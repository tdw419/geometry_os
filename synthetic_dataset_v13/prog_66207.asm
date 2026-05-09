; DESCRIPTION: Draws a cyan circle centered at (202, 151) with radius 35.
; PLAN: r0=202(x), r1=151(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 151
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
