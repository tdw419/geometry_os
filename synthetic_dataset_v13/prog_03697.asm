; DESCRIPTION: Creates a yellow rectangular region at (154, 57) spanning 34 by 68 pixels.
; PLAN: r0=154(x), r1=57(y), r2=34(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 57
LDI r2, 34
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
