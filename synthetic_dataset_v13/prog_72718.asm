; DESCRIPTION: Creates a cyan rectangular region at (117, 63) spanning 66 by 68 pixels.
; PLAN: r0=117(x), r1=63(y), r2=66(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 63
LDI r2, 66
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
