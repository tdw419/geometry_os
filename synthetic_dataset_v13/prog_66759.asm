; DESCRIPTION: Creates a orange rectangular region at (59, 147) spanning 12 by 88 pixels.
; PLAN: r0=59(x), r1=147(y), r2=12(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 147
LDI r2, 12
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
