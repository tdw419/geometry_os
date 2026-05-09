; DESCRIPTION: Places a red circle of radius 42 at center (85, 210).
; PLAN: r0=85(x), r1=210(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 210
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
