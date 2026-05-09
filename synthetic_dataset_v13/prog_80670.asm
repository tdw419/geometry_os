; DESCRIPTION: Creates a orange rectangular region at (262, 44) spanning 88 by 96 pixels.
; PLAN: r0=262(x), r1=44(y), r2=88(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 44
LDI r2, 88
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
