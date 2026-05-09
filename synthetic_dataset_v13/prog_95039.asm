; DESCRIPTION: Creates a magenta rectangular region at (214, 159) spanning 108 by 73 pixels.
; PLAN: r0=214(x), r1=159(y), r2=108(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 159
LDI r2, 108
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
