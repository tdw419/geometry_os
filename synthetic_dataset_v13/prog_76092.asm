; DESCRIPTION: Creates a cyan rectangular region at (66, 67) spanning 87 by 65 pixels.
; PLAN: r0=66(x), r1=67(y), r2=87(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 67
LDI r2, 87
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
