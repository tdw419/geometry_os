; DESCRIPTION: Creates a cyan rectangular region at (42, 145) spanning 85 by 72 pixels.
; PLAN: r0=42(x), r1=145(y), r2=85(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 145
LDI r2, 85
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
