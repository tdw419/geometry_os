; DESCRIPTION: Creates a cyan rectangular region at (396, 30) spanning 91 by 28 pixels.
; PLAN: r0=396(x), r1=30(y), r2=91(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 30
LDI r2, 91
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
