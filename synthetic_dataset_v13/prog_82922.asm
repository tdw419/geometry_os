; DESCRIPTION: Places a cyan circle of radius 47 at center (202, 69).
; PLAN: r0=202(x), r1=69(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 69
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
