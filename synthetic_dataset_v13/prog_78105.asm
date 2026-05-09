; DESCRIPTION: Places a red circle of radius 44 at center (268, 125).
; PLAN: r0=268(x), r1=125(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 125
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
