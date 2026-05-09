; DESCRIPTION: Places a cyan circle of radius 63 at center (283, 125).
; PLAN: r0=283(x), r1=125(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 125
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
