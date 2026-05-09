; DESCRIPTION: Creates a cyan rectangular region at (255, 62) spanning 17 by 12 pixels.
; PLAN: r0=255(x), r1=62(y), r2=17(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 62
LDI r2, 17
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
