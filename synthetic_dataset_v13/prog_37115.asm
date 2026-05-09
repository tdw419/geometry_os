; DESCRIPTION: Creates a magenta rectangular region at (79, 130) spanning 103 by 113 pixels.
; PLAN: r0=79(x), r1=130(y), r2=103(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 130
LDI r2, 103
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
