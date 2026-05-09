; DESCRIPTION: Places a red circle of radius 42 at center (316, 163).
; PLAN: r0=316(x), r1=163(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 163
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
