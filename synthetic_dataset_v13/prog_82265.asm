; DESCRIPTION: Draws a cyan circle centered at (118, 171) with radius 60.
; PLAN: r0=118(x), r1=171(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 171
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
