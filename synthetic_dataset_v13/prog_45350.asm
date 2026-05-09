; DESCRIPTION: Places a cyan circle of radius 51 at center (108, 116).
; PLAN: r0=108(x), r1=116(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 116
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
