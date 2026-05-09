; DESCRIPTION: Places a green circle of radius 29 at center (187, 225).
; PLAN: r0=187(x), r1=225(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 225
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
