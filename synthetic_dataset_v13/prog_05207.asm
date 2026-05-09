; DESCRIPTION: Creates a cyan rectangular region at (249, 11) spanning 87 by 78 pixels.
; PLAN: r0=249(x), r1=11(y), r2=87(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 11
LDI r2, 87
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
