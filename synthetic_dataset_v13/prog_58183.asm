; DESCRIPTION: Creates a red rectangular region at (353, 103) spanning 13 by 11 pixels.
; PLAN: r0=353(x), r1=103(y), r2=13(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 103
LDI r2, 13
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
