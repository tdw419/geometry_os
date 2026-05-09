; DESCRIPTION: Creates a orange rectangular region at (391, 15) spanning 28 by 112 pixels.
; PLAN: r0=391(x), r1=15(y), r2=28(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 15
LDI r2, 28
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
