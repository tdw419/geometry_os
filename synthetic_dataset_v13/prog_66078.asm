; DESCRIPTION: Places a red circle of radius 29 at center (172, 135).
; PLAN: r0=172(x), r1=135(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 135
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
