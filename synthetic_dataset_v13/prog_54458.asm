; DESCRIPTION: Creates a cyan rectangular region at (310, 116) spanning 15 by 30 pixels.
; PLAN: r0=310(x), r1=116(y), r2=15(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 116
LDI r2, 15
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
