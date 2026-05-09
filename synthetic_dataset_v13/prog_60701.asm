; DESCRIPTION: Places a green circle of radius 77 at center (187, 102).
; PLAN: r0=187(x), r1=102(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 102
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
