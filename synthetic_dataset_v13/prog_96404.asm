; DESCRIPTION: Creates a green rectangular region at (306, 42) spanning 76 by 75 pixels.
; PLAN: r0=306(x), r1=42(y), r2=76(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 42
LDI r2, 76
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
