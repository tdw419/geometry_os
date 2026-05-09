; DESCRIPTION: Creates a cyan rectangular region at (193, 72) spanning 97 by 58 pixels.
; PLAN: r0=193(x), r1=72(y), r2=97(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 72
LDI r2, 97
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
