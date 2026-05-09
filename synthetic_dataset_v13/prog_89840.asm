; DESCRIPTION: Creates a magenta rectangular region at (228, 60) spanning 39 by 103 pixels.
; PLAN: r0=228(x), r1=60(y), r2=39(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 60
LDI r2, 39
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
