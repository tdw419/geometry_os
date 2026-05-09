; DESCRIPTION: Creates a yellow rectangular region at (421, 16) spanning 68 by 46 pixels.
; PLAN: r0=421(x), r1=16(y), r2=68(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 16
LDI r2, 68
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
