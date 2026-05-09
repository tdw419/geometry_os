; DESCRIPTION: Draws a red circle centered at (416, 109) with radius 42.
; PLAN: r0=416(x), r1=109(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 109
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
