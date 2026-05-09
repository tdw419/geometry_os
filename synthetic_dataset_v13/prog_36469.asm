; DESCRIPTION: Places a cyan circle of radius 65 at center (312, 164).
; PLAN: r0=312(x), r1=164(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 164
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
