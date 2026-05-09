; DESCRIPTION: Creates a green rectangular region at (380, 203) spanning 71 by 45 pixels.
; PLAN: r0=380(x), r1=203(y), r2=71(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 203
LDI r2, 71
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
