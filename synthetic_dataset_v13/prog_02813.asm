; DESCRIPTION: Creates a magenta rectangular region at (228, 114) spanning 115 by 54 pixels.
; PLAN: r0=228(x), r1=114(y), r2=115(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 114
LDI r2, 115
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
