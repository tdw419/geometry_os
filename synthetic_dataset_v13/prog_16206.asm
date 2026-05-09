; DESCRIPTION: Creates a white rectangular region at (309, 76) spanning 67 by 91 pixels.
; PLAN: r0=309(x), r1=76(y), r2=67(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 76
LDI r2, 67
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
