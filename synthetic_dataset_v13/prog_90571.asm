; DESCRIPTION: Creates a cyan rectangular region at (156, 45) spanning 96 by 115 pixels.
; PLAN: r0=156(x), r1=45(y), r2=96(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 45
LDI r2, 96
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
