; DESCRIPTION: Places a cyan circle of radius 44 at center (254, 196).
; PLAN: r0=254(x), r1=196(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 196
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
