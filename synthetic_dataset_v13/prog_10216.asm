; DESCRIPTION: Creates a cyan rectangular region at (42, 4) spanning 81 by 105 pixels.
; PLAN: r0=42(x), r1=4(y), r2=81(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 4
LDI r2, 81
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
