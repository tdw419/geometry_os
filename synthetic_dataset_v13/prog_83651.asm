; DESCRIPTION: Draws a red circle centered at (224, 77) with radius 30.
; PLAN: r0=224(x), r1=77(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 77
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
