; DESCRIPTION: Creates a red rectangular region at (205, 190) spanning 29 by 13 pixels.
; PLAN: r0=205(x), r1=190(y), r2=29(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 190
LDI r2, 29
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
