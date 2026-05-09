; DESCRIPTION: Creates a cyan rectangular region at (153, 108) spanning 26 by 68 pixels.
; PLAN: r0=153(x), r1=108(y), r2=26(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 108
LDI r2, 26
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
