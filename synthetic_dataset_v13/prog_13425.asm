; DESCRIPTION: Creates a magenta rectangular region at (352, 86) spanning 109 by 36 pixels.
; PLAN: r0=352(x), r1=86(y), r2=109(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 86
LDI r2, 109
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
