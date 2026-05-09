; DESCRIPTION: Creates a cyan rectangular region at (118, 2) spanning 82 by 60 pixels.
; PLAN: r0=118(x), r1=2(y), r2=82(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 2
LDI r2, 82
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
