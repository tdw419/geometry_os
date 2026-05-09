; DESCRIPTION: Creates a orange rectangular region at (256, 109) spanning 17 by 116 pixels.
; PLAN: r0=256(x), r1=109(y), r2=17(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 109
LDI r2, 17
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
