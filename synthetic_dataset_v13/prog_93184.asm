; DESCRIPTION: Creates a red rectangular region at (134, 143) spanning 87 by 70 pixels.
; PLAN: r0=134(x), r1=143(y), r2=87(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 143
LDI r2, 87
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
