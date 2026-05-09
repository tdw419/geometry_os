; DESCRIPTION: Creates a orange rectangular region at (256, 171) spanning 15 by 57 pixels.
; PLAN: r0=256(x), r1=171(y), r2=15(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 171
LDI r2, 15
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
