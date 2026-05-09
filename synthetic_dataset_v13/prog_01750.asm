; DESCRIPTION: Places a cyan circle of radius 55 at center (457, 196).
; PLAN: r0=457(x), r1=196(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 196
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
