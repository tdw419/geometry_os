; DESCRIPTION: Creates a magenta rectangular region at (352, 206) spanning 98 by 20 pixels.
; PLAN: r0=352(x), r1=206(y), r2=98(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 206
LDI r2, 98
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
