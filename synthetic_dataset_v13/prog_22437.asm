; DESCRIPTION: Draws a red circle centered at (218, 217) with radius 27.
; PLAN: r0=218(x), r1=217(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 217
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
