; DESCRIPTION: Places a orange circle of radius 47 at center (276, 125).
; PLAN: r0=276(x), r1=125(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 125
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
