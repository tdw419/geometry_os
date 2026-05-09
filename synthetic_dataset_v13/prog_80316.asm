; DESCRIPTION: Creates a magenta rectangular region at (284, 18) spanning 78 by 116 pixels.
; PLAN: r0=284(x), r1=18(y), r2=78(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 18
LDI r2, 78
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
