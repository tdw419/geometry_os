; DESCRIPTION: Places a cyan circle of radius 74 at center (367, 125).
; PLAN: r0=367(x), r1=125(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 125
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
