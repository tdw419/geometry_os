; DESCRIPTION: Creates a magenta rectangular region at (338, 74) spanning 103 by 36 pixels.
; PLAN: r0=338(x), r1=74(y), r2=103(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 74
LDI r2, 103
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
