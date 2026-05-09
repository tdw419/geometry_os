; DESCRIPTION: Creates a orange rectangular region at (333, 212) spanning 116 by 43 pixels.
; PLAN: r0=333(x), r1=212(y), r2=116(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 212
LDI r2, 116
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
