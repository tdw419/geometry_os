; DESCRIPTION: Places a red circle of radius 10 at center (303, 98).
; PLAN: r0=303(x), r1=98(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 98
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
