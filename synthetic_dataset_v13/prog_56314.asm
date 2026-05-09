; DESCRIPTION: Creates a magenta rectangular region at (29, 206) spanning 102 by 27 pixels.
; PLAN: r0=29(x), r1=206(y), r2=102(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 206
LDI r2, 102
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
