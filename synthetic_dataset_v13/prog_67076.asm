; DESCRIPTION: Creates a cyan rectangular region at (396, 68) spanning 44 by 84 pixels.
; PLAN: r0=396(x), r1=68(y), r2=44(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 68
LDI r2, 44
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
