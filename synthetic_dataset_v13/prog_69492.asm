; DESCRIPTION: Creates a cyan rectangular region at (302, 42) spanning 13 by 55 pixels.
; PLAN: r0=302(x), r1=42(y), r2=13(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 42
LDI r2, 13
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
