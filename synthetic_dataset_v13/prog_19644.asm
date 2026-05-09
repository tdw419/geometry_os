; DESCRIPTION: Draws a orange circle centered at (120, 215) with radius 12.
; PLAN: r0=120(x), r1=215(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 215
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
