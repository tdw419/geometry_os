; DESCRIPTION: Places a black circle of radius 38 at center (146, 77).
; PLAN: r0=146(x), r1=77(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 77
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
