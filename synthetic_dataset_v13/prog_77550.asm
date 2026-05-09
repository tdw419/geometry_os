; DESCRIPTION: Creates a yellow rectangular region at (50, 105) spanning 13 by 29 pixels.
; PLAN: r0=50(x), r1=105(y), r2=13(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 105
LDI r2, 13
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
