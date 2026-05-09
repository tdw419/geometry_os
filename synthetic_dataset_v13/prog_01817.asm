; DESCRIPTION: Creates a cyan rectangular region at (183, 49) spanning 63 by 40 pixels.
; PLAN: r0=183(x), r1=49(y), r2=63(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 49
LDI r2, 63
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
