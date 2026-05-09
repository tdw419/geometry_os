; DESCRIPTION: Creates a orange rectangular region at (245, 28) spanning 101 by 74 pixels.
; PLAN: r0=245(x), r1=28(y), r2=101(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 28
LDI r2, 101
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
