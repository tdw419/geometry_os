; DESCRIPTION: Places a cyan circle of radius 27 at center (107, 39).
; PLAN: r0=107(x), r1=39(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 39
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
