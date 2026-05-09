; DESCRIPTION: Creates a cyan rectangular region at (278, 40) spanning 108 by 49 pixels.
; PLAN: r0=278(x), r1=40(y), r2=108(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 40
LDI r2, 108
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
