; DESCRIPTION: Places a black circle of radius 70 at center (209, 91).
; PLAN: r0=209(x), r1=91(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 91
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
