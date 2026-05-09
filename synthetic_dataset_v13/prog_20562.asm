; DESCRIPTION: Creates a cyan rectangular region at (307, 78) spanning 101 by 42 pixels.
; PLAN: r0=307(x), r1=78(y), r2=101(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 78
LDI r2, 101
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
