; DESCRIPTION: Draws a cyan circle centered at (413, 141) with radius 48.
; PLAN: r0=413(x), r1=141(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 141
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
