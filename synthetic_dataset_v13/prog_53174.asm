; DESCRIPTION: Places a red circle of radius 62 at center (146, 69).
; PLAN: r0=146(x), r1=69(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 69
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
