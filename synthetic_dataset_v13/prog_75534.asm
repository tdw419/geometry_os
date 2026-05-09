; DESCRIPTION: Places a green circle of radius 55 at center (59, 187).
; PLAN: r0=59(x), r1=187(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 187
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
