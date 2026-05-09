; DESCRIPTION: Creates a orange rectangular region at (292, 140) spanning 31 by 50 pixels.
; PLAN: r0=292(x), r1=140(y), r2=31(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 140
LDI r2, 31
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
