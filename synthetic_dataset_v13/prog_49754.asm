; DESCRIPTION: Creates a green rectangular region at (122, 154) spanning 70 by 57 pixels.
; PLAN: r0=122(x), r1=154(y), r2=70(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 154
LDI r2, 70
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
