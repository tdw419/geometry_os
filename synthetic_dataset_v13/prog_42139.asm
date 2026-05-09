; DESCRIPTION: Creates a magenta rectangular region at (46, 109) spanning 49 by 64 pixels.
; PLAN: r0=46(x), r1=109(y), r2=49(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 109
LDI r2, 49
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
