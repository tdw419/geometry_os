; DESCRIPTION: Creates a green rectangular region at (405, 74) spanning 76 by 88 pixels.
; PLAN: r0=405(x), r1=74(y), r2=76(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 74
LDI r2, 76
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
