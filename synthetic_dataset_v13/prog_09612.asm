; DESCRIPTION: Places a red circle of radius 28 at center (356, 42).
; PLAN: r0=356(x), r1=42(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 42
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
