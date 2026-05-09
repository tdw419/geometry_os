; DESCRIPTION: Places a cyan circle of radius 66 at center (164, 103).
; PLAN: r0=164(x), r1=103(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 103
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
