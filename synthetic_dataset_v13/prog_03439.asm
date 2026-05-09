; DESCRIPTION: Creates a yellow rectangular region at (50, 227) spanning 32 by 28 pixels.
; PLAN: r0=50(x), r1=227(y), r2=32(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 227
LDI r2, 32
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
