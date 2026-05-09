; DESCRIPTION: Creates a green rectangular region at (304, 46) spanning 76 by 49 pixels.
; PLAN: r0=304(x), r1=46(y), r2=76(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 46
LDI r2, 76
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
