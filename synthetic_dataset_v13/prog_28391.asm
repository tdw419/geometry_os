; DESCRIPTION: Creates a orange rectangular region at (62, 147) spanning 67 by 47 pixels.
; PLAN: r0=62(x), r1=147(y), r2=67(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 147
LDI r2, 67
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
