; DESCRIPTION: Creates a red rectangular region at (49, 176) spanning 45 by 27 pixels.
; PLAN: r0=49(x), r1=176(y), r2=45(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 176
LDI r2, 45
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
