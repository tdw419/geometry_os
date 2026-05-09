; DESCRIPTION: Draws a cyan circle centered at (278, 117) with radius 54.
; PLAN: r0=278(x), r1=117(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 117
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
