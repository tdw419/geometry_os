; DESCRIPTION: Creates a orange rectangular region at (207, 130) spanning 88 by 42 pixels.
; PLAN: r0=207(x), r1=130(y), r2=88(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 130
LDI r2, 88
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
