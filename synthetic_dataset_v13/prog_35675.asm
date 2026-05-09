; DESCRIPTION: Draws a red circle centered at (272, 168) with radius 71.
; PLAN: r0=272(x), r1=168(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 168
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
