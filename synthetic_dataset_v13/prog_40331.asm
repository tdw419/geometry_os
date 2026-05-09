; DESCRIPTION: Draws a red circle centered at (202, 71) with radius 16.
; PLAN: r0=202(x), r1=71(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 71
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
