; DESCRIPTION: Creates a cyan rectangular region at (233, 15) spanning 82 by 96 pixels.
; PLAN: r0=233(x), r1=15(y), r2=82(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 15
LDI r2, 82
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
