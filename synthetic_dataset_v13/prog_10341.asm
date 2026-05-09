; DESCRIPTION: Creates a cyan rectangular region at (375, 174) spanning 43 by 16 pixels.
; PLAN: r0=375(x), r1=174(y), r2=43(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 174
LDI r2, 43
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
