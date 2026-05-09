; DESCRIPTION: Creates a red circular shape at (255, 212) with radius 42.
; PLAN: r0=255(x), r1=212(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 212
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
