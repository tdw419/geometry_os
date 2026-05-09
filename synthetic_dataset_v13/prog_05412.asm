; DESCRIPTION: Creates a magenta rectangular region at (206, 124) spanning 26 by 23 pixels.
; PLAN: r0=206(x), r1=124(y), r2=26(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 124
LDI r2, 26
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
