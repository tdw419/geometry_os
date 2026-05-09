; DESCRIPTION: Draws a cyan circle centered at (386, 230) with radius 10.
; PLAN: r0=386(x), r1=230(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 230
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
