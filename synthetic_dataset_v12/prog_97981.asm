; DESCRIPTION: Creates a red rectangular region at (7, 130) spanning 75 by 85 pixels.
; PLAN: r0=7(x), r1=130(y), r2=75(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 130
LDI r2, 75
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
