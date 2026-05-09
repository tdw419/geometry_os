; DESCRIPTION: Creates a orange rectangular region at (153, 186) spanning 19 by 30 pixels.
; PLAN: r0=153(x), r1=186(y), r2=19(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 186
LDI r2, 19
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
