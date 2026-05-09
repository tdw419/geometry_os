; DESCRIPTION: Creates a orange rectangular region at (174, 60) spanning 50 by 74 pixels.
; PLAN: r0=174(x), r1=60(y), r2=50(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 60
LDI r2, 50
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
