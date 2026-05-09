; DESCRIPTION: Creates a red rectangular region at (252, 109) spanning 113 by 23 pixels.
; PLAN: r0=252(x), r1=109(y), r2=113(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 109
LDI r2, 113
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
