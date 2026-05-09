; DESCRIPTION: Creates a magenta rectangular region at (393, 27) spanning 73 by 73 pixels.
; PLAN: r0=393(x), r1=27(y), r2=73(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 27
LDI r2, 73
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
