; DESCRIPTION: Creates a magenta rectangular region at (281, 126) spanning 116 by 81 pixels.
; PLAN: r0=281(x), r1=126(y), r2=116(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 126
LDI r2, 116
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
