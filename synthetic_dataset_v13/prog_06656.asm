; DESCRIPTION: Draws a cyan circle centered at (60, 229) with radius 15.
; PLAN: r0=60(x), r1=229(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 229
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
