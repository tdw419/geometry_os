; DESCRIPTION: Creates a orange rectangular region at (369, 42) spanning 94 by 113 pixels.
; PLAN: r0=369(x), r1=42(y), r2=94(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 42
LDI r2, 94
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
