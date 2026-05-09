; DESCRIPTION: Draws a cyan circle centered at (31, 229) with radius 27.
; PLAN: r0=31(x), r1=229(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 229
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
