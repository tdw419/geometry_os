; DESCRIPTION: Creates a magenta rectangular region at (417, 114) spanning 14 by 109 pixels.
; PLAN: r0=417(x), r1=114(y), r2=14(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 114
LDI r2, 14
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
