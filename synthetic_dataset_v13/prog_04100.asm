; DESCRIPTION: Places a green circle of radius 55 at center (117, 134).
; PLAN: r0=117(x), r1=134(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 134
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
