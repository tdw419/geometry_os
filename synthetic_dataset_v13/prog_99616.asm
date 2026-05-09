; DESCRIPTION: Places a red circle of radius 33 at center (42, 97).
; PLAN: r0=42(x), r1=97(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 97
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
