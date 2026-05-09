; DESCRIPTION: Creates a white rectangular region at (443, 88) spanning 67 by 91 pixels.
; PLAN: r0=443(x), r1=88(y), r2=67(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 88
LDI r2, 67
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
