; DESCRIPTION: Creates a yellow rectangular region at (284, 97) spanning 62 by 101 pixels.
; PLAN: r0=284(x), r1=97(y), r2=62(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 97
LDI r2, 62
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
