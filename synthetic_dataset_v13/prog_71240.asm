; DESCRIPTION: Creates a yellow rectangular region at (75, 188) spanning 67 by 31 pixels.
; PLAN: r0=75(x), r1=188(y), r2=67(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 188
LDI r2, 67
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
