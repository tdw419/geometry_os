; DESCRIPTION: Places a red circle of radius 46 at center (260, 139).
; PLAN: r0=260(x), r1=139(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 139
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
