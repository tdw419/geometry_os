; DESCRIPTION: Draws a red circle centered at (79, 120) with radius 50.
; PLAN: r0=79(x), r1=120(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 120
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
