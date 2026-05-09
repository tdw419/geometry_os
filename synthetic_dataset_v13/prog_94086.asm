; DESCRIPTION: Creates a red rectangular region at (205, 95) spanning 68 by 83 pixels.
; PLAN: r0=205(x), r1=95(y), r2=68(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 95
LDI r2, 68
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
