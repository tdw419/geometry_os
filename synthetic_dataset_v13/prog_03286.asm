; DESCRIPTION: Places a white circle of radius 36 at center (327, 91).
; PLAN: r0=327(x), r1=91(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 91
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
