; DESCRIPTION: Creates a cyan rectangular region at (265, 87) spanning 108 by 113 pixels.
; PLAN: r0=265(x), r1=87(y), r2=108(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 87
LDI r2, 108
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
