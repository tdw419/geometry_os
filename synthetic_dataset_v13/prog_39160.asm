; DESCRIPTION: Creates a red rectangular region at (268, 6) spanning 113 by 36 pixels.
; PLAN: r0=268(x), r1=6(y), r2=113(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 6
LDI r2, 113
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
