; DESCRIPTION: Creates a yellow rectangular region at (211, 206) spanning 102 by 14 pixels.
; PLAN: r0=211(x), r1=206(y), r2=102(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 206
LDI r2, 102
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
