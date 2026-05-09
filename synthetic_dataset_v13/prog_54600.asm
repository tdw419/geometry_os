; DESCRIPTION: Creates a cyan rectangular region at (250, 3) spanning 82 by 15 pixels.
; PLAN: r0=250(x), r1=3(y), r2=82(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 3
LDI r2, 82
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
