; DESCRIPTION: Creates a yellow rectangular region at (0, 67) spanning 40 by 38 pixels.
; PLAN: r0=0(x), r1=67(y), r2=40(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 67
LDI r2, 40
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
