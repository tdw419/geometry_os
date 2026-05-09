; DESCRIPTION: Creates a orange rectangular region at (167, 24) spanning 61 by 117 pixels.
; PLAN: r0=167(x), r1=24(y), r2=61(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 24
LDI r2, 61
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
