; DESCRIPTION: Creates a cyan rectangular region at (15, 11) spanning 43 by 80 pixels.
; PLAN: r0=15(x), r1=11(y), r2=43(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 11
LDI r2, 43
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
