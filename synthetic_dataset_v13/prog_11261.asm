; DESCRIPTION: Creates a orange rectangular region at (248, 126) spanning 47 by 99 pixels.
; PLAN: r0=248(x), r1=126(y), r2=47(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 126
LDI r2, 47
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
