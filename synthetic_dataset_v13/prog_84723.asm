; DESCRIPTION: Creates a white rectangular region at (231, 134) spanning 84 by 38 pixels.
; PLAN: r0=231(x), r1=134(y), r2=84(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 134
LDI r2, 84
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
