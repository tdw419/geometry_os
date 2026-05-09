; DESCRIPTION: Places a red circle of radius 50 at center (157, 148).
; PLAN: r0=157(x), r1=148(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 148
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
