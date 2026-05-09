; DESCRIPTION: Creates a red rectangular region at (203, 119) spanning 95 by 85 pixels.
; PLAN: r0=203(x), r1=119(y), r2=95(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 119
LDI r2, 95
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
