; DESCRIPTION: Creates a cyan rectangular region at (273, 12) spanning 108 by 70 pixels.
; PLAN: r0=273(x), r1=12(y), r2=108(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 12
LDI r2, 108
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
