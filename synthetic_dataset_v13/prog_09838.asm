; DESCRIPTION: Creates a magenta rectangular region at (346, 225) spanning 81 by 14 pixels.
; PLAN: r0=346(x), r1=225(y), r2=81(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 225
LDI r2, 81
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
