; DESCRIPTION: Creates a cyan rectangular region at (42, 22) spanning 54 by 108 pixels.
; PLAN: r0=42(x), r1=22(y), r2=54(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 22
LDI r2, 54
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
