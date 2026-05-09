; DESCRIPTION: Places a red circle of radius 72 at center (366, 91).
; PLAN: r0=366(x), r1=91(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 91
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
