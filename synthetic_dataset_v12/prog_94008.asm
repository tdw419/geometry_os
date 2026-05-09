; DESCRIPTION: Creates a cyan rectangular region at (116, 149) spanning 63 by 105 pixels.
; PLAN: r0=116(x), r1=149(y), r2=63(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 149
LDI r2, 63
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
