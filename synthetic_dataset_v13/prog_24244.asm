; DESCRIPTION: Places a cyan circle of radius 21 at center (259, 27).
; PLAN: r0=259(x), r1=27(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 27
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
