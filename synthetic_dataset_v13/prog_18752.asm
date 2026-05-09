; DESCRIPTION: Places a red circle of radius 80 at center (225, 83).
; PLAN: r0=225(x), r1=83(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 83
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
