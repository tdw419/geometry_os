; DESCRIPTION: Places a red circle of radius 46 at center (383, 187).
; PLAN: r0=383(x), r1=187(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 187
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
