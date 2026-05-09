; DESCRIPTION: Creates a orange rectangular region at (154, 86) spanning 69 by 59 pixels.
; PLAN: r0=154(x), r1=86(y), r2=69(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 86
LDI r2, 69
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
