; DESCRIPTION: Places a green circle of radius 45 at center (182, 91).
; PLAN: r0=182(x), r1=91(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 91
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
