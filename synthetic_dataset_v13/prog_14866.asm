; DESCRIPTION: Creates a magenta rectangular region at (362, 0) spanning 113 by 103 pixels.
; PLAN: r0=362(x), r1=0(y), r2=113(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 0
LDI r2, 113
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
