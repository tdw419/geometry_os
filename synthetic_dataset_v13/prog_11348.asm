; DESCRIPTION: Creates a cyan rectangular region at (169, 123) spanning 115 by 42 pixels.
; PLAN: r0=169(x), r1=123(y), r2=115(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 123
LDI r2, 115
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
