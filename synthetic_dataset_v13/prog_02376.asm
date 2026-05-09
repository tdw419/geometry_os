; DESCRIPTION: Creates a yellow rectangular region at (76, 65) spanning 67 by 52 pixels.
; PLAN: r0=76(x), r1=65(y), r2=67(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 65
LDI r2, 67
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
