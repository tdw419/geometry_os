; DESCRIPTION: Creates a white rectangular region at (58, 161) spanning 84 by 50 pixels.
; PLAN: r0=58(x), r1=161(y), r2=84(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 161
LDI r2, 84
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
