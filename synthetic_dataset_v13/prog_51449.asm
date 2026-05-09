; DESCRIPTION: Creates a cyan rectangular region at (67, 119) spanning 87 by 45 pixels.
; PLAN: r0=67(x), r1=119(y), r2=87(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 119
LDI r2, 87
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
