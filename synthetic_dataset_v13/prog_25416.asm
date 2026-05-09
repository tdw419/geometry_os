; DESCRIPTION: Places a white circle of radius 79 at center (272, 172).
; PLAN: r0=272(x), r1=172(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 172
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
