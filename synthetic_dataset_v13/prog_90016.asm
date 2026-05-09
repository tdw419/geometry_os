; DESCRIPTION: Places a cyan circle of radius 29 at center (69, 179).
; PLAN: r0=69(x), r1=179(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 179
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
