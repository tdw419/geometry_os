; DESCRIPTION: Creates a orange rectangular region at (271, 94) spanning 85 by 62 pixels.
; PLAN: r0=271(x), r1=94(y), r2=85(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 94
LDI r2, 85
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
