; DESCRIPTION: Creates a orange rectangular region at (302, 67) spanning 86 by 37 pixels.
; PLAN: r0=302(x), r1=67(y), r2=86(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 67
LDI r2, 86
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
