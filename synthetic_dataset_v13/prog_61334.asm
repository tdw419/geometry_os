; DESCRIPTION: Places a white circle of radius 68 at center (381, 146).
; PLAN: r0=381(x), r1=146(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 146
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
