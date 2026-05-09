; DESCRIPTION: Creates a yellow rectangular region at (69, 38) spanning 61 by 13 pixels.
; PLAN: r0=69(x), r1=38(y), r2=61(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 38
LDI r2, 61
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
