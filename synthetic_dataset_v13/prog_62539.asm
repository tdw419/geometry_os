; DESCRIPTION: Places a red circle of radius 61 at center (245, 107).
; PLAN: r0=245(x), r1=107(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 107
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
