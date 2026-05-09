; DESCRIPTION: Creates a orange rectangular region at (388, 74) spanning 73 by 113 pixels.
; PLAN: r0=388(x), r1=74(y), r2=73(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 74
LDI r2, 73
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
