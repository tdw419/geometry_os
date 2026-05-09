; DESCRIPTION: Places a red circle of radius 75 at center (370, 161).
; PLAN: r0=370(x), r1=161(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 161
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
