; DESCRIPTION: Places a cyan circle of radius 45 at center (447, 164).
; PLAN: r0=447(x), r1=164(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 164
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
