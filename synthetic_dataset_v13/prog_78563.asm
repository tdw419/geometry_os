; DESCRIPTION: Places a green circle of radius 57 at center (275, 126).
; PLAN: r0=275(x), r1=126(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 126
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
