; DESCRIPTION: Draws a red circle centered at (303, 50) with radius 42.
; PLAN: r0=303(x), r1=50(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 50
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
