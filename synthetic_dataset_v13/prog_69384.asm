; DESCRIPTION: Creates a red rectangular region at (252, 13) spanning 115 by 79 pixels.
; PLAN: r0=252(x), r1=13(y), r2=115(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 13
LDI r2, 115
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
