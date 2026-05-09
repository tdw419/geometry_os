; DESCRIPTION: Creates a yellow rectangular region at (282, 182) spanning 33 by 23 pixels.
; PLAN: r0=282(x), r1=182(y), r2=33(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 182
LDI r2, 33
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
