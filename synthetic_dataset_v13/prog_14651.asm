; DESCRIPTION: Creates a orange rectangular region at (173, 215) spanning 101 by 17 pixels.
; PLAN: r0=173(x), r1=215(y), r2=101(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 215
LDI r2, 101
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
