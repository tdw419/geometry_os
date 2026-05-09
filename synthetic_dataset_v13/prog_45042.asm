; DESCRIPTION: Creates a cyan rectangular region at (337, 172) spanning 37 by 26 pixels.
; PLAN: r0=337(x), r1=172(y), r2=37(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 172
LDI r2, 37
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
