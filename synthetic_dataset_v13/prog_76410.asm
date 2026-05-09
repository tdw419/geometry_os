; DESCRIPTION: Creates a magenta rectangular region at (304, 56) spanning 104 by 33 pixels.
; PLAN: r0=304(x), r1=56(y), r2=104(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 56
LDI r2, 104
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
