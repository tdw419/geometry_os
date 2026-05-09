; DESCRIPTION: Creates a orange rectangular region at (164, 87) spanning 42 by 29 pixels.
; PLAN: r0=164(x), r1=87(y), r2=42(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 87
LDI r2, 42
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
