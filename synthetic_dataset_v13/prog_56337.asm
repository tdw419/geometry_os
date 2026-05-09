; DESCRIPTION: Creates a cyan rectangular region at (248, 70) spanning 69 by 94 pixels.
; PLAN: r0=248(x), r1=70(y), r2=69(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 70
LDI r2, 69
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
