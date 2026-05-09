; DESCRIPTION: Draws a cyan circle centered at (208, 60) with radius 48.
; PLAN: r0=208(x), r1=60(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 60
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
