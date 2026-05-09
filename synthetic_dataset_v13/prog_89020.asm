; DESCRIPTION: Creates a cyan rectangular region at (276, 67) spanning 16 by 37 pixels.
; PLAN: r0=276(x), r1=67(y), r2=16(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 67
LDI r2, 16
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
