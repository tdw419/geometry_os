; DESCRIPTION: Creates a orange rectangular region at (168, 49) spanning 103 by 74 pixels.
; PLAN: r0=168(x), r1=49(y), r2=103(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 49
LDI r2, 103
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
