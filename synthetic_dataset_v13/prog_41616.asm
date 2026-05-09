; DESCRIPTION: Creates a magenta rectangular region at (333, 131) spanning 82 by 114 pixels.
; PLAN: r0=333(x), r1=131(y), r2=82(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 131
LDI r2, 82
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
