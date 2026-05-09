; DESCRIPTION: Places a cyan circle of radius 56 at center (126, 196).
; PLAN: r0=126(x), r1=196(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 196
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
