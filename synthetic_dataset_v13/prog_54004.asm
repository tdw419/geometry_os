; DESCRIPTION: Creates a red rectangular region at (254, 143) spanning 43 by 47 pixels.
; PLAN: r0=254(x), r1=143(y), r2=43(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 143
LDI r2, 43
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
