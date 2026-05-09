; DESCRIPTION: Creates a cyan rectangular region at (159, 154) spanning 78 by 85 pixels.
; PLAN: r0=159(x), r1=154(y), r2=78(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 154
LDI r2, 78
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
