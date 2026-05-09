; DESCRIPTION: Creates a cyan rectangular region at (37, 76) spanning 42 by 112 pixels.
; PLAN: r0=37(x), r1=76(y), r2=42(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 76
LDI r2, 42
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
