; DESCRIPTION: Creates a magenta rectangular region at (79, 103) spanning 105 by 15 pixels.
; PLAN: r0=79(x), r1=103(y), r2=105(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 103
LDI r2, 105
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
