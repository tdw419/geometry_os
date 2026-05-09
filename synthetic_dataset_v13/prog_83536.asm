; DESCRIPTION: Creates a orange rectangular region at (214, 103) spanning 114 by 85 pixels.
; PLAN: r0=214(x), r1=103(y), r2=114(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 103
LDI r2, 114
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
