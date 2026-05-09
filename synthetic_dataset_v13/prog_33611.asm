; DESCRIPTION: Places a black circle of radius 76 at center (428, 146).
; PLAN: r0=428(x), r1=146(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 146
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
