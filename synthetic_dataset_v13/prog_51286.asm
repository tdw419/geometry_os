; DESCRIPTION: Creates a orange rectangular region at (302, 173) spanning 37 by 49 pixels.
; PLAN: r0=302(x), r1=173(y), r2=37(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 173
LDI r2, 37
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
