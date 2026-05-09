; DESCRIPTION: Draws a cyan circle centered at (144, 131) with radius 70.
; PLAN: r0=144(x), r1=131(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 131
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
