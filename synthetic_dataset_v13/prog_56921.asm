; DESCRIPTION: Creates a white rectangular region at (118, 75) spanning 91 by 42 pixels.
; PLAN: r0=118(x), r1=75(y), r2=91(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 75
LDI r2, 91
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
