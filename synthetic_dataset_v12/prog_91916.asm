; DESCRIPTION: Creates a cyan rectangular region at (424, 126) spanning 87 by 108 pixels.
; PLAN: r0=424(x), r1=126(y), r2=87(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 126
LDI r2, 87
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
