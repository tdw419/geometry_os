; DESCRIPTION: Creates a magenta rectangular region at (7, 167) spanning 50 by 15 pixels.
; PLAN: r0=7(x), r1=167(y), r2=50(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 167
LDI r2, 50
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
