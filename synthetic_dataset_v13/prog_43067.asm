; DESCRIPTION: Creates a orange rectangular region at (136, 116) spanning 107 by 71 pixels.
; PLAN: r0=136(x), r1=116(y), r2=107(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 116
LDI r2, 107
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
