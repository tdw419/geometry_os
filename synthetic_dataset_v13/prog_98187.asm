; DESCRIPTION: Places a cyan circle of radius 78 at center (216, 166).
; PLAN: r0=216(x), r1=166(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 166
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
