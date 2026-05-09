; DESCRIPTION: Creates a cyan rectangular region at (280, 62) spanning 116 by 63 pixels.
; PLAN: r0=280(x), r1=62(y), r2=116(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 62
LDI r2, 116
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
