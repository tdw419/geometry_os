; DESCRIPTION: Places a cyan circle of radius 77 at center (123, 131).
; PLAN: r0=123(x), r1=131(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 131
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
