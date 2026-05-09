; DESCRIPTION: Creates a yellow rectangular region at (15, 172) spanning 82 by 59 pixels.
; PLAN: r0=15(x), r1=172(y), r2=82(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 172
LDI r2, 82
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
