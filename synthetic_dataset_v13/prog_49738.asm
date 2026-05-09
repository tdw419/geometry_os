; DESCRIPTION: Places a cyan circle of radius 27 at center (261, 147).
; PLAN: r0=261(x), r1=147(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 147
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
