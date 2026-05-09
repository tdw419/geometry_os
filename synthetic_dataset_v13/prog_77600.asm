; DESCRIPTION: Creates a orange rectangular region at (178, 65) spanning 63 by 67 pixels.
; PLAN: r0=178(x), r1=65(y), r2=63(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 65
LDI r2, 63
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
