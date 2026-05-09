; DESCRIPTION: Creates a cyan rectangular region at (197, 82) spanning 69 by 11 pixels.
; PLAN: r0=197(x), r1=82(y), r2=69(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 82
LDI r2, 69
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
