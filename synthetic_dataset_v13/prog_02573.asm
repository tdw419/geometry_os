; DESCRIPTION: Places a cyan circle of radius 75 at center (185, 91).
; PLAN: r0=185(x), r1=91(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 91
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
