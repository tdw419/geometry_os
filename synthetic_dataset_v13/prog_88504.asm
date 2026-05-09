; DESCRIPTION: Creates a red rectangular region at (435, 205) spanning 11 by 34 pixels.
; PLAN: r0=435(x), r1=205(y), r2=11(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 205
LDI r2, 11
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
