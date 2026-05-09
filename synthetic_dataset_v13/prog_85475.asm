; DESCRIPTION: Places a red circle of radius 49 at center (303, 198).
; PLAN: r0=303(x), r1=198(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 198
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
