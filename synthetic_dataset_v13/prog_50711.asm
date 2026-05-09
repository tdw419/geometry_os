; DESCRIPTION: Creates a cyan rectangular region at (337, 126) spanning 83 by 110 pixels.
; PLAN: r0=337(x), r1=126(y), r2=83(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 126
LDI r2, 83
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
