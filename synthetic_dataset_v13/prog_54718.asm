; DESCRIPTION: Places a cyan circle of radius 40 at center (224, 131).
; PLAN: r0=224(x), r1=131(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 131
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
