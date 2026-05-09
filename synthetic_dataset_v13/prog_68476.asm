; DESCRIPTION: Creates a orange rectangular region at (123, 134) spanning 63 by 103 pixels.
; PLAN: r0=123(x), r1=134(y), r2=63(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 134
LDI r2, 63
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
