; DESCRIPTION: Creates a white rectangular region at (296, 122) spanning 25 by 54 pixels.
; PLAN: r0=296(x), r1=122(y), r2=25(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 122
LDI r2, 25
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
