; DESCRIPTION: Creates a orange rectangular region at (72, 42) spanning 54 by 43 pixels.
; PLAN: r0=72(x), r1=42(y), r2=54(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 42
LDI r2, 54
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
