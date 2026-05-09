; DESCRIPTION: Creates a orange rectangular region at (332, 3) spanning 95 by 57 pixels.
; PLAN: r0=332(x), r1=3(y), r2=95(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 3
LDI r2, 95
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
