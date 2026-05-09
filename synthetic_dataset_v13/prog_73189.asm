; DESCRIPTION: Creates a cyan rectangular region at (337, 164) spanning 85 by 76 pixels.
; PLAN: r0=337(x), r1=164(y), r2=85(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 164
LDI r2, 85
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
