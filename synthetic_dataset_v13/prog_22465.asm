; DESCRIPTION: Creates a orange rectangular region at (416, 154) spanning 69 by 45 pixels.
; PLAN: r0=416(x), r1=154(y), r2=69(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 154
LDI r2, 69
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
