; DESCRIPTION: Creates a orange rectangular region at (59, 28) spanning 17 by 107 pixels.
; PLAN: r0=59(x), r1=28(y), r2=17(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 28
LDI r2, 17
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
