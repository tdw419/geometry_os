; DESCRIPTION: Creates a magenta rectangular region at (328, 114) spanning 91 by 81 pixels.
; PLAN: r0=328(x), r1=114(y), r2=91(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 114
LDI r2, 91
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
