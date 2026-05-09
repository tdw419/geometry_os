; DESCRIPTION: Creates a orange rectangular region at (68, 69) spanning 95 by 120 pixels.
; PLAN: r0=68(x), r1=69(y), r2=95(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 69
LDI r2, 95
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
