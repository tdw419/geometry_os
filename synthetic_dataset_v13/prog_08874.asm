; DESCRIPTION: Creates a yellow rectangular region at (341, 154) spanning 71 by 76 pixels.
; PLAN: r0=341(x), r1=154(y), r2=71(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 154
LDI r2, 71
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
