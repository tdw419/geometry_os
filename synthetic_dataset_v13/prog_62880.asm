; DESCRIPTION: Creates a cyan rectangular region at (462, 154) spanning 42 by 99 pixels.
; PLAN: r0=462(x), r1=154(y), r2=42(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 154
LDI r2, 42
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
