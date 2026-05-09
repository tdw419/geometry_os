; DESCRIPTION: Creates a yellow rectangular region at (139, 182) spanning 61 by 17 pixels.
; PLAN: r0=139(x), r1=182(y), r2=61(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 182
LDI r2, 61
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
