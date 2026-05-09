; DESCRIPTION: Creates a orange rectangular region at (168, 159) spanning 43 by 60 pixels.
; PLAN: r0=168(x), r1=159(y), r2=43(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 159
LDI r2, 43
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
