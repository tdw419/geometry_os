; DESCRIPTION: Creates a white rectangular region at (268, 42) spanning 118 by 91 pixels.
; PLAN: r0=268(x), r1=42(y), r2=118(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 42
LDI r2, 118
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
