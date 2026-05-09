; DESCRIPTION: Creates a orange rectangular region at (186, 60) spanning 15 by 31 pixels.
; PLAN: r0=186(x), r1=60(y), r2=15(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 60
LDI r2, 15
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
