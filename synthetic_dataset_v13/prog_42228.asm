; DESCRIPTION: Creates a cyan rectangular region at (37, 69) spanning 50 by 31 pixels.
; PLAN: r0=37(x), r1=69(y), r2=50(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 69
LDI r2, 50
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
