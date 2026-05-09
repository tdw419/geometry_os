; DESCRIPTION: Places a red circle of radius 46 at center (61, 143).
; PLAN: r0=61(x), r1=143(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 143
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
