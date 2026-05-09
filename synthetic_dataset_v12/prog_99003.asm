; DESCRIPTION: Creates a cyan rectangular region at (265, 123) spanning 25 by 109 pixels.
; PLAN: r0=265(x), r1=123(y), r2=25(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 123
LDI r2, 25
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
