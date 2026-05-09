; DESCRIPTION: Places a cyan circle of radius 59 at center (250, 89).
; PLAN: r0=250(x), r1=89(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 89
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
