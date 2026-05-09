; DESCRIPTION: Places a green circle of radius 58 at center (294, 161).
; PLAN: r0=294(x), r1=161(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 161
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
