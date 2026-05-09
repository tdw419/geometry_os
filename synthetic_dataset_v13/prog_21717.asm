; DESCRIPTION: Places a cyan circle of radius 54 at center (126, 96).
; PLAN: r0=126(x), r1=96(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 96
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
