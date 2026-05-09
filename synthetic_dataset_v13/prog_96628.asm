; DESCRIPTION: Creates a yellow rectangular region at (341, 6) spanning 81 by 82 pixels.
; PLAN: r0=341(x), r1=6(y), r2=81(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 6
LDI r2, 81
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
