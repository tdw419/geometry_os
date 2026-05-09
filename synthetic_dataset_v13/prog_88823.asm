; DESCRIPTION: Creates a cyan rectangular region at (273, 222) spanning 12 by 31 pixels.
; PLAN: r0=273(x), r1=222(y), r2=12(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 222
LDI r2, 12
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
