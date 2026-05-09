; DESCRIPTION: Creates a orange rectangular region at (396, 92) spanning 57 by 27 pixels.
; PLAN: r0=396(x), r1=92(y), r2=57(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 92
LDI r2, 57
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
