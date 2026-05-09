; DESCRIPTION: Creates a red rectangular region at (353, 15) spanning 63 by 13 pixels.
; PLAN: r0=353(x), r1=15(y), r2=63(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 15
LDI r2, 63
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
