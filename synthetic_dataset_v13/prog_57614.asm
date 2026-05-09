; DESCRIPTION: Places a cyan circle of radius 15 at center (370, 224).
; PLAN: r0=370(x), r1=224(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 224
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
