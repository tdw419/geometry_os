; DESCRIPTION: Creates a magenta rectangular region at (202, 109) spanning 62 by 110 pixels.
; PLAN: r0=202(x), r1=109(y), r2=62(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 109
LDI r2, 62
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
