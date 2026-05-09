; DESCRIPTION: Places a red circle of radius 69 at center (195, 126).
; PLAN: r0=195(x), r1=126(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 126
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
