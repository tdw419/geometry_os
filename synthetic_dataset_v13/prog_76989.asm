; DESCRIPTION: Creates a white rectangular region at (42, 15) spanning 91 by 91 pixels.
; PLAN: r0=42(x), r1=15(y), r2=91(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 15
LDI r2, 91
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
