; DESCRIPTION: Creates a orange rectangular region at (237, 171) spanning 62 by 37 pixels.
; PLAN: r0=237(x), r1=171(y), r2=62(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 171
LDI r2, 62
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
