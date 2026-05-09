; DESCRIPTION: Places a cyan circle of radius 35 at center (303, 125).
; PLAN: r0=303(x), r1=125(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 125
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
