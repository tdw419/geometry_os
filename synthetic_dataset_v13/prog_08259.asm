; DESCRIPTION: Creates a cyan rectangular region at (341, 90) spanning 42 by 105 pixels.
; PLAN: r0=341(x), r1=90(y), r2=42(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 90
LDI r2, 42
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
