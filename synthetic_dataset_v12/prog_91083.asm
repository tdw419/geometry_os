; DESCRIPTION: Creates a magenta rectangular region at (189, 124) spanning 14 by 109 pixels.
; PLAN: r0=189(x), r1=124(y), r2=14(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 124
LDI r2, 14
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
