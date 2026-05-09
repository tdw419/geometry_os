; DESCRIPTION: Creates a magenta rectangular region at (239, 150) spanning 108 by 41 pixels.
; PLAN: r0=239(x), r1=150(y), r2=108(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 150
LDI r2, 108
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
