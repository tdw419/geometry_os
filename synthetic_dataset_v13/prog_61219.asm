; DESCRIPTION: Creates a cyan rectangular region at (159, 206) spanning 85 by 13 pixels.
; PLAN: r0=159(x), r1=206(y), r2=85(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 206
LDI r2, 85
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
