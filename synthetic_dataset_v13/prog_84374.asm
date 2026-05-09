; DESCRIPTION: Creates a orange rectangular region at (124, 42) spanning 71 by 63 pixels.
; PLAN: r0=124(x), r1=42(y), r2=71(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 42
LDI r2, 71
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
