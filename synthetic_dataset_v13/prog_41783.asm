; DESCRIPTION: Creates a cyan rectangular region at (192, 30) spanning 98 by 19 pixels.
; PLAN: r0=192(x), r1=30(y), r2=98(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 30
LDI r2, 98
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
