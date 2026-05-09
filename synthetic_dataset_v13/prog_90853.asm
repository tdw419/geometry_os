; DESCRIPTION: Draws a red circle centered at (120, 220) with radius 32.
; PLAN: r0=120(x), r1=220(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 220
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
