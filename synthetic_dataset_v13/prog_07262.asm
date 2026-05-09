; DESCRIPTION: Places a cyan circle of radius 16 at center (185, 104).
; PLAN: r0=185(x), r1=104(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 104
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
