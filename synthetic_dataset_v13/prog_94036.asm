; DESCRIPTION: Draws a red circle centered at (295, 147) with radius 48.
; PLAN: r0=295(x), r1=147(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 147
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
