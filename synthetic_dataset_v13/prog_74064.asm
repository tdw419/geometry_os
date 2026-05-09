; DESCRIPTION: Creates a yellow rectangular region at (416, 158) spanning 58 by 42 pixels.
; PLAN: r0=416(x), r1=158(y), r2=58(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 158
LDI r2, 58
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
