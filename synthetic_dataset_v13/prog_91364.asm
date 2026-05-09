; DESCRIPTION: Creates a yellow rectangular region at (136, 67) spanning 21 by 36 pixels.
; PLAN: r0=136(x), r1=67(y), r2=21(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 67
LDI r2, 21
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
