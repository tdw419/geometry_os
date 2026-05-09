; DESCRIPTION: Creates a orange rectangular region at (140, 64) spanning 95 by 17 pixels.
; PLAN: r0=140(x), r1=64(y), r2=95(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 64
LDI r2, 95
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
