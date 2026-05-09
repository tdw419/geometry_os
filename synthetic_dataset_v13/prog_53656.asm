; DESCRIPTION: Places a cyan circle of radius 44 at center (291, 169).
; PLAN: r0=291(x), r1=169(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 169
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
