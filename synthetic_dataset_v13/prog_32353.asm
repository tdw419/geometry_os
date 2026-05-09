; DESCRIPTION: Creates a magenta rectangular region at (214, 95) spanning 64 by 46 pixels.
; PLAN: r0=214(x), r1=95(y), r2=64(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 95
LDI r2, 64
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
