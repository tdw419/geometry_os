; DESCRIPTION: Places a red circle of radius 42 at center (460, 211).
; PLAN: r0=460(x), r1=211(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 211
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
