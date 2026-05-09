; DESCRIPTION: Creates a cyan rectangular region at (122, 17) spanning 37 by 98 pixels.
; PLAN: r0=122(x), r1=17(y), r2=37(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 17
LDI r2, 37
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
