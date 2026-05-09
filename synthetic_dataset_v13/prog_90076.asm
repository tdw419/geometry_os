; DESCRIPTION: Creates a cyan rectangular region at (272, 12) spanning 42 by 69 pixels.
; PLAN: r0=272(x), r1=12(y), r2=42(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 12
LDI r2, 42
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
