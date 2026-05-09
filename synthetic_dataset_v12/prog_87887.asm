; DESCRIPTION: Creates a magenta rectangular region at (104, 174) spanning 21 by 28 pixels.
; PLAN: r0=104(x), r1=174(y), r2=21(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 174
LDI r2, 21
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
