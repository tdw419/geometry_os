; DESCRIPTION: Draws a red circle centered at (304, 152) with radius 46.
; PLAN: r0=304(x), r1=152(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 152
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
