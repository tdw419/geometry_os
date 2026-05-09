; DESCRIPTION: Places a green circle of radius 41 at center (405, 215).
; PLAN: r0=405(x), r1=215(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 215
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
