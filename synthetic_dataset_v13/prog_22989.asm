; DESCRIPTION: Creates a orange rectangular region at (346, 78) spanning 94 by 28 pixels.
; PLAN: r0=346(x), r1=78(y), r2=94(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 78
LDI r2, 94
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
