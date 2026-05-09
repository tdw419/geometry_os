; DESCRIPTION: Places a white circle of radius 77 at center (193, 174).
; PLAN: r0=193(x), r1=174(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 174
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
