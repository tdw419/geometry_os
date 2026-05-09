; DESCRIPTION: Creates a red circular shape at (428, 197) with radius 29.
; PLAN: r0=428(x), r1=197(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 197
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
