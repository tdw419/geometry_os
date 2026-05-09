; DESCRIPTION: Creates a magenta rectangular region at (182, 8) spanning 36 by 98 pixels.
; PLAN: r0=182(x), r1=8(y), r2=36(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 8
LDI r2, 36
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
