; DESCRIPTION: Creates a red rectangular region at (182, 79) spanning 60 by 30 pixels.
; PLAN: r0=182(x), r1=79(y), r2=60(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 79
LDI r2, 60
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
