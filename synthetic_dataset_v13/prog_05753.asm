; DESCRIPTION: Creates a cyan rectangular region at (375, 217) spanning 17 by 11 pixels.
; PLAN: r0=375(x), r1=217(y), r2=17(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 217
LDI r2, 17
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
