; DESCRIPTION: Creates a cyan rectangular region at (100, 57) spanning 74 by 42 pixels.
; PLAN: r0=100(x), r1=57(y), r2=74(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 57
LDI r2, 74
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
