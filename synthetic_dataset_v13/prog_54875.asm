; DESCRIPTION: Creates a cyan rectangular region at (156, 29) spanning 82 by 76 pixels.
; PLAN: r0=156(x), r1=29(y), r2=82(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 29
LDI r2, 82
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
