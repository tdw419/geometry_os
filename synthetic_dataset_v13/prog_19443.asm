; DESCRIPTION: Creates a orange rectangular region at (143, 198) spanning 113 by 12 pixels.
; PLAN: r0=143(x), r1=198(y), r2=113(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 198
LDI r2, 113
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
