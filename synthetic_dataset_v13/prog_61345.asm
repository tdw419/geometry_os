; DESCRIPTION: Creates a magenta rectangular region at (214, 160) spanning 82 by 29 pixels.
; PLAN: r0=214(x), r1=160(y), r2=82(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 160
LDI r2, 82
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
