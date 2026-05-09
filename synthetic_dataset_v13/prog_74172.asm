; DESCRIPTION: Creates a cyan rectangular region at (15, 0) spanning 53 by 30 pixels.
; PLAN: r0=15(x), r1=0(y), r2=53(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 0
LDI r2, 53
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
