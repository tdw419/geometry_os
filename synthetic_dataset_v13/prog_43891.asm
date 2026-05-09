; DESCRIPTION: Creates a cyan rectangular region at (318, 9) spanning 64 by 68 pixels.
; PLAN: r0=318(x), r1=9(y), r2=64(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 9
LDI r2, 64
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
