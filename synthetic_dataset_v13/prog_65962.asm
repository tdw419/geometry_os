; DESCRIPTION: Creates a orange rectangular region at (247, 186) spanning 85 by 31 pixels.
; PLAN: r0=247(x), r1=186(y), r2=85(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 186
LDI r2, 85
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
