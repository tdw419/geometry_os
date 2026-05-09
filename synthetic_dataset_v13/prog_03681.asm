; DESCRIPTION: Places a black circle of radius 65 at center (74, 91).
; PLAN: r0=74(x), r1=91(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 91
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
