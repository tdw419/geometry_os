; DESCRIPTION: Creates a orange rectangular region at (384, 39) spanning 40 by 92 pixels.
; PLAN: r0=384(x), r1=39(y), r2=40(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 39
LDI r2, 40
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
