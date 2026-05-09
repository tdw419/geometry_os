; DESCRIPTION: Creates a red rectangular region at (242, 85) spanning 88 by 97 pixels.
; PLAN: r0=242(x), r1=85(y), r2=88(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 85
LDI r2, 88
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
