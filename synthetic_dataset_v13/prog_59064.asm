; DESCRIPTION: Draws a red circle centered at (179, 144) with radius 42.
; PLAN: r0=179(x), r1=144(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 144
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
