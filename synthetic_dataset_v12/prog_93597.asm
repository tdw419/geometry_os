; DESCRIPTION: Creates a orange rectangular region at (241, 1) spanning 50 by 15 pixels.
; PLAN: r0=241(x), r1=1(y), r2=50(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 1
LDI r2, 50
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
